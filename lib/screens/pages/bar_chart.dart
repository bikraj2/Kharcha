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
          groupsSpace: 12,
          barTouchData: BarTouchData(enabled: true) ,
          barGroups: 
          
        )
        
      ),
    );
  }
}
class Data {
  // for ordering in the graph
  final int id;
  final String name;
  final double y;
  final Color color;

  const Data({
    required this.name,
    required this.id,
    required this.y,
    required this.color,
  });
}


class BarData {
  static int interval = 5;

  static List<Data> barData = [
    const Data(
      id: 0,
      name: 'Mon',
      y: 15,
      color: Color(0xff19bfff),
    ),
    const Data(
      name: 'Tue',
      id: 1,
      y: -12,
      color: Color(0xffff4d94),
    ),
    const Data(
      name: 'Wed',
      id: 2,
      y: 11,
      color: Color(0xff2bdb90),
    ),
    const Data(
      name: 'Thu',
      id: 3,
      y: 10,
      color: Color(0xffffdd80),
    ),
    const Data(
      name: 'Fri',
      id: 4,
      y: -5,
      color: Color(0xff2bdb90),
    ),
    const Data(
      name: 'Sat',
      id: 5,
      y: -17,
      color: Color(0xffffdd80),
    ),
    const Data(
      name: 'Sun',
      id: 6,
      y: 5,
      color: Color(0xffff4d94),
    ),
  ];
}
