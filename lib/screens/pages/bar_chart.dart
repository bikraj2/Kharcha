import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:intl/intl.dart';
import 'graphs_page.dart';
import '../../models/chart.dart'; 
import 'package:demo2/services/authservices.dart';
import '../../token/token.dart';
import '../charts/pie_chart.dart';



class BarChart extends StatefulWidget {
  BarChart({Key? key}) : super(key: key);

  @override
  State<BarChart> createState() => _BarChartState();
}


class _BarChartState extends State<BarChart> {
  var date = DateTime.now();
  late var weekday = DateFormat('EEEE').format(date);

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
                  testClass.addExpenseFuction(userEntries, val),
                  testClass1().weekdaySelection(weekday),
                  
                  
                });
          });
        } catch (e) {
          print(e);
        }
      }
    }
    get(); 
    return Scaffold(
      body: BarChart(


      )

    ); 
  }
}
