import 'package:demo2/models/chart.dart';
import 'package:demo2/services/authservices.dart';
import 'package:demo2/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:demo2/token/token.dart';
import 'package:pie_chart/pie_chart.dart';

import 'package:intl/intl.dart';

class PieChartPage extends StatefulWidget {
  const PieChartPage({Key? key}) : super(key: key);

  @override
  _PieChartPageState createState() => _PieChartPageState();
}

class _PieChartPageState extends State<PieChartPage> {
  @override
  Widget build(BuildContext context) {
    void get() {
      {
        try {
          healthAmount = 0;
          foodAmount = 0;
          luxuryAmount = 0;
          rentAmount = 0;
          token.storage.read(key: "jwt").then((value) {
            AuthService().getExpense(value as String).then((val) => {
                  userEntries = val.data["ans"].length,
                  //make a function here .
                  //what kind of a function rey
                  // tyo function jasle chai
                  for (int i = 0; i < userEntries; i++)
                    {
                      if (val.data["ans"][i]["category"] == "Health")
                        {
                          healthAmount =
                              val.data["ans"][i]["amount"] + healthAmount,
                        },
                      if (val.data["ans"][i]["category"] == "Luxury")
                        {
                          luxuryAmount =
                              val.data["ans"][i]["amount"] + luxuryAmount,
                        },
                      if (val.data["ans"][i]["category"] == "Rent")
                        {
                          rentAmount =
                              val.data["ans"][i]["amount"] + rentAmount,
                        },
                      if (val.data["ans"][i]["category"] == "Food")
                        {
                          foodAmount =
                              val.data["ans"][i]["amount"] + foodAmount,
                        }
                    },
                  print(healthAmount),
                  print(rentAmount),
                  print(foodAmount),
                  print(luxuryAmount),
                });
          });
        } catch (e) {
          print(e);
        }
      }
    }

    Map<String, double> dataMap = {
      "Health": healthAmount.toDouble(),
      "Rent": rentAmount.toDouble(),
      "Food": foodAmount.toDouble(),
      "Luxury": luxuryAmount.toDouble(),
    };

    List<Color> colorList = [
      Color.fromARGB(255, 4, 26, 47),
      Color.fromARGB(255, 135, 122, 64),
      Color.fromARGB(255, 216, 141, 27),
      AppTheme.colors.basecolor,
    ];

    // final gradientList = <List<Color>>[
    //   [AppTheme.colors.basecolor, AppTheme.colors.secondarycolor],
    //   [Color.fromARGB(255, 232, 100, 137), Color.fromARGB(255, 13, 17, 23)],
    //   [AppTheme.colors.secondarycolor, Color.fromARGB(0, 63, 62, 62)]
    // ];
    get();
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Your weekly expenses"),
      ),
      body: Center(
        child: PieChart(
          dataMap: dataMap,
          colorList: colorList,
          chartRadius: MediaQuery.of(context).size.width / 2,
          centerText: "Expenses",
          centerTextStyle: const TextStyle(
              color: Colors.white, fontWeight: FontWeight.w600, fontSize: 16),

          ringStrokeWidth: 100,
          animationDuration: const Duration(seconds: 3),
          chartValuesOptions: const ChartValuesOptions(
              showChartValues: true,
              chartValueStyle: defaultChartValueStyle,
              showChartValuesOutside: true,
              showChartValuesInPercentage: true,
              showChartValueBackground: false),
          legendOptions: const LegendOptions(
              showLegends: true,
              legendShape: BoxShape.rectangle,
              legendTextStyle: TextStyle(fontSize: 15),
              legendPosition: LegendPosition.bottom,
              showLegendsInRow: true),

          // gradientList: gradientList,
        ),
      ),
    );
  }

  addExpenseFuction(int userEntries, val) {}
}
