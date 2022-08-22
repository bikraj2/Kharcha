import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';
import '../pages/add_expenses.dart';
import '../../models/chart.dart';

class Piechart extends StatefulWidget {
  const Piechart({Key? key}) : super(key: key);

  @override
  State<Piechart> createState() => _PieChartState();
}

class _PieChartState extends State<Piechart> {
  var chart = Chart(); 
  Map<String, double> dataMap = {
    "Health": chart.healthAmount.toDouble(),
    "Rent": chart.rentAmount.toDouble(),
    "Food": chart.foodAmount.toDouble(),
    "Luxury": chart.luxuryAmount.toDouble(),
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

  @override
  Widget build(BuildContext context) {
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
