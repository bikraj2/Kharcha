import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:fl_chart/fl_chart.dart';

class BarChartClass extends StatelessWidget {
  const BarChartClass({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Bar Chart Here!"),
      ),
      body: BarChartClass1(),
    );
  }
}

class BarChartClass1 extends StatefulWidget {
  const BarChartClass1({Key? key}) : super(key: key);

  @override
  State<BarChartClass1> createState() => _BarChartClass1State();
}

class _BarChartClass1State extends State<BarChartClass1> {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: BarChart(
        BarChartData(
          minY: 0, 
          maxY : 10000, 
          
        )
        
      ),
    );
  }
}
