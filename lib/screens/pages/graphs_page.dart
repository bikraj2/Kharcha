import 'package:flutter/material.dart';
import 'bar_chart.dart';
import 'line_chart.dart';
import 'pie_chart.dart';

class GraphPage extends StatefulWidget {
  const GraphPage({super.key});

  @override
  State<GraphPage> createState() => _GraphPageState();
}

class _GraphPageState extends State<GraphPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
          child: Column(
        children: [
          ElevatedButton(onPressed: () {
            Navigator.push(context,
                    MaterialPageRoute(builder: (BuildContext) {
                  return PieChartPage();
                }));
          }, child: Text("Pie Chart")),
          ElevatedButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (BuildContext) {
                  return LineChartClass1();
                }));
              },
              child: Text("Line Chart")),
          ElevatedButton(onPressed: () {
            Navigator.push(context,
                    MaterialPageRoute(builder: (BuildContext) {
                  return BarChartSample1();
                }));
          }, child: Text("bar Chart")),
          ElevatedButton(onPressed: () {
            Navigator.push(context,
                    MaterialPageRoute(builder: (BuildContext) {
                  return BarChartSample1();
                }));
          }, child: Text("bar Chart")),
        ],
      )),
    );
  }
}
