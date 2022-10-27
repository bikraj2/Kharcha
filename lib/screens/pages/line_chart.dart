import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class LineChartClass1 extends StatelessWidget {
  const LineChartClass1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Line Chart Here!"),
      ),
      body: LineChartClass(),
    );
  }
}

class LineChartClass extends StatefulWidget {
  LineChartClass({Key? key}) : super(key: key);

  @override
  State<LineChartClass> createState() => _LineChartClassState();
}

class _LineChartClassState extends State<LineChartClass> {
  @override
  Widget build(BuildContext context) {
    return Card(
        color: Colors.white,
        margin: EdgeInsets.all(100),
        child: LineChart(
          LineChartData(
            maxY: 10000,
            maxX: 7,
            minY: -1000,
            minX: -0,
            gridData: FlGridData(
                show: true,
                getDrawingHorizontalLine: (value) {
                  return FlLine(
                    strokeWidth: 3,
                  );
                },
                getDrawingVerticalLine: (value) {
                  return FlLine(
                    strokeWidth: 3,
                  );
                }),
            borderData: FlBorderData(
              show: true,
              border: Border.all(
                color: Colors.white,
                width: 1,
              ),
            ),
            // titlesData: FlTitlesData(
            //   bottomTitles: AxisTitles(sideTitles: _bottomTitles),
            // ),
            lineBarsData: [
              LineChartBarData(
                  spots: [
                    FlSpot(0, 2345),
                    FlSpot(1, 2336),
                    FlSpot(2, 6232),
                    FlSpot(3, 1223),
                    FlSpot(4, 4232),
                    FlSpot(5, 1223),
                  ],
                  isCurved: true,
                  belowBarData: BarAreaData(
                    show: true,
                    color: Colors.blue.withOpacity(0.5),
                  ))
            ],
          ),
        ));
  }
}

SideTitles get _bottomTitles => SideTitles(
      showTitles: true,
      getTitlesWidget: (value, meta) {
        String text = '';
        switch (value.toInt()) {
          case 0:
            text = 'S';
            break;
          case 1:
            text = 'M';
            break;
          case 2:
            text = 'T';
            break;
          case 3:
            text = 'W';
            break;
          case 4:
            text = 'T';
            break;
          case 5:
            text = 'F';
            break;
          case 6:
            text = 'S';
            break;
        }

        return Text(text);
      },
    );
