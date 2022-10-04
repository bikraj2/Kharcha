import 'package:demo2/models/chart.dart';
import 'package:demo2/screens/charts/pie_chart.dart';
import 'package:demo2/services/authservices.dart';
import 'package:flutter/material.dart';
import 'package:demo2/token/token.dart';
import 'package:pie_chart/pie_chart.dart';

class GraphsPage extends StatefulWidget {
  const GraphsPage({Key? key}) : super(key: key);

  @override
  _GraphsPageState createState() => _GraphsPageState();
}

class _GraphsPageState extends State<GraphsPage> {
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
            AuthService().getExpense(value).then((val) => {
                  userEntries = val.data["ans"].length,
                  //make a function here .
                  //what kind of a function rey
                  // tyo function jasle chai

                  print(val.data["ans"][0]["category"].runtimeType),
                  addExpenseFuction(userEntries, val)
                  // for (int i = 0; i < userEntries; i++)
                  //   {
                  //     if (val.data["ans"][i]["category"] == "Health")
                  //       {
                  //         healthAmount =
                  //             val.data["ans"][i]["amount"] + healthAmount,
                  //       },
                  //     if (val.data["ans"][i]["category"] == "Luxury")
                  //       {
                  //         luxuryAmount =
                  //             val.data["ans"][i]["amount"] + luxuryAmount,
                  //       },
                  //     if (val.data["ans"][i]["category"] == "Rent")
                  //       {
                  //         rentAmount = val.data["ans"][i]["amount"] + rentAmount,
                  //       },
                  //     if (val.data["ans"][i]["category"] == "Food")
                  //       {
                  //         foodAmount = val.data["ans"][i]["amount"] + foodAmount,
                  //       }
                  //   }
                  ,
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
      const Color.fromRGBO(129, 250, 112, 1),
      const Color.fromRGBO(91, 253, 199, 1),
      const Color.fromRGBO(254, 154, 92, 1),
      const Color.fromRGBO(55, 100, 32, 22),
    ];

    final gradientList = <List<Color>>[
      [
        Color.fromRGBO(223, 250, 92, 1),
        Color.fromRGBO(129, 250, 112, 1),
      ],
      [
        Color.fromRGBO(129, 182, 205, 1),
        Color.fromRGBO(91, 253, 199, 1),
      ],
      [
        Color.fromRGBO(175, 63, 62, 1.0),
        Color.fromRGBO(254, 154, 92, 1),
      ]
    ];
    get();
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 40,
        centerTitle: true,
        title: const Text("Your weekly expenses"),
      ),
      body: Center(
        child: PieChart(
          dataMap: dataMap,
          colorList: colorList,
          chartRadius: MediaQuery.of(context).size.width / 2,
          centerText: "Expenses",
          ringStrokeWidth: 24,
          animationDuration: const Duration(seconds: 3),
          chartValuesOptions: const ChartValuesOptions(
              showChartValues: true,
              showChartValuesOutside: true,
              showChartValuesInPercentage: true,
              showChartValueBackground: false),
          legendOptions: const LegendOptions(
              showLegends: true,
              legendShape: BoxShape.rectangle,
              legendTextStyle: TextStyle(fontSize: 15),
              legendPosition: LegendPosition.bottom,
              showLegendsInRow: true),
          gradientList: gradientList,
        ),
      ),
    );
  }
}
