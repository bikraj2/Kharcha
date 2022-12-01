import 'dart:math';

import 'package:demo2/theme/theme.dart';
import '../../theme/theme.dart';

import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:intl/intl.dart';

import '../../models/expenses.dart';
import 'package:demo2/token/token.dart';
import 'package:demo2/services/authservices.dart';
import 'package:demo2/models/expenseList.dart';

class BarChartSample1 extends StatefulWidget {
  const BarChartSample1({super.key});

  List<Color> get availableColors => <Color>[
        AppTheme.colors.secondarycolor,
        AppTheme.colors.basecolor,
        AppTheme.colors.boxcolor,
        Color.fromARGB(255, 239, 45, 100),
        Color.fromARGB(255, 15, 50, 66),
        Color.fromARGB(255, 142, 44, 77),
        Color.fromARGB(255, 3, 6, 37),
      ];

  @override
  State<StatefulWidget> createState() => BarChartSample1State();
}

class BarChartSample1State extends State<BarChartSample1> {
  List<Map<String, Object>> value1 = [];

  final Color barBackgroundColor = AppTheme.colors.basecolor;
  final Duration animDuration = Duration(milliseconds: 250);
  bool isLoading = true;
  int touchedIndex = -1;

  bool isPlaying = false;

  @override
  Widget build(BuildContext context) {
    value1 = ExpenseList.groupedData;
    print(value1);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Bar Chart"),
      ),
      body: AspectRatio(
          aspectRatio: MediaQuery.of(context).size.width /
              MediaQuery.of(context).size.width.toDouble(),
          child: Center(
            child: Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5)),
              color: Colors.white,
              child: Stack(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        // Text(
                        //   'BarChart',
                        //   style: TextStyle(
                        //     color: AppTheme.colors.secondarycolor,
                        //     fontSize: 24,
                        //     fontWeight: FontWeight.bold,
                        //   ),
                        // ),
                        // const SizedBox(
                        //   height: 4,
                        // ),
                        Text(
                          'Your Weekly Expenses ',
                          style: TextStyle(
                            color: AppTheme.colors.basecolor,
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        Expanded(
                          child: Container(child: BarChart(mainBarData())),
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          )),
    );
  }

  BarChartGroupData makeGroupData(
    int x,
    double y, {
    bool isTouched = false,
    Color barColor = const Color.fromARGB(255, 35, 45, 64),
    double width = 20,
    List<int> showTooltips = const [],
  }) {
    return BarChartGroupData(
      x: x,
      barRods: [
        BarChartRodData(
          toY: isTouched ? y + 1 : y,
          color: isTouched ? Colors.yellow : barColor,
          width: width,
          borderSide: isTouched
              ? BorderSide(color: Colors.yellow.darken())
              : const BorderSide(color: Colors.red, width: 0),
          backDrawRodData: BackgroundBarChartRodData(
            show: true,
            toY: 20,
            color: barBackgroundColor,
          ),
        ),
      ],
      showingTooltipIndicators: showTooltips,
    );
  }

  List<BarChartGroupData> showingGroups() {
    return List.generate(7, (i) {
      switch (i) {
        case 0:
          return makeGroupData(0, value1[6]['amount'] as double,
              isTouched: i == touchedIndex);
        case 1:
          return makeGroupData(1, value1[5]['amount'] as double,
              isTouched: i == touchedIndex);
        case 2:
          return makeGroupData(2, value1[4]['amount'] as double,
              isTouched: i == touchedIndex);
        case 3:
          return makeGroupData(3, value1[3]['amount'] as double,
              isTouched: i == touchedIndex);
        case 4:
          return makeGroupData(4, value1[2]['amount'] as double,
              isTouched: i == touchedIndex);
        case 5:
          return makeGroupData(5, value1[1]['amount'] as double,
              isTouched: i == touchedIndex);
        case 6:
          return makeGroupData(6, value1[0]['amount'] as double,
              isTouched: i == touchedIndex);
        default:
          return throw Error();
      }
    });
  }

  BarChartData mainBarData() {
    return BarChartData(
      titlesData: FlTitlesData(
        show: true,
        rightTitles: AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        topTitles: AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        bottomTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            getTitlesWidget: getTitles,
            reservedSize: 38,
          ),
        ),
        leftTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: false,
          ),
        ),
      ),
      borderData: FlBorderData(
        show: false,
      ),
      barGroups: showingGroups(),
      gridData: FlGridData(show: false),
    );
  }

  Widget getTitles(double value, TitleMeta meta) {
    const style = TextStyle(
      color: const Color.fromARGB(255, 35, 45, 64),
      fontWeight: FontWeight.w700,
      fontSize: 14,
    );
    Widget text;

    switch (value.toInt()) {
      case 0:
        String temp = value1[6]['day'] as String;
        text = Text(temp[0], style: style);
        break;
      case 1:
        String temp = value1[5]['day'] as String;
        text = Text(temp[0], style: style);
        break;
      case 2:
        String temp = value1[4]['day'] as String;
        text = Text(temp[0], style: style);
        break;
      case 3:
        String temp = value1[3]['day'] as String;
        text = Text(temp[0], style: style);
        break;
      case 4:
        String temp = value1[2]['day'] as String;
        text = Text(temp[0], style: style);
        break;
      case 5:
        String temp = value1[1]['day'] as String;
        text = Text(temp[0], style: style);
        break;
      case 6:
        String temp = value1[0]['day'] as String;
        text = Text(temp[0], style: style);
        break;
      default:
        text = const Text('', style: style);
        break;
    }
    return SideTitleWidget(
      axisSide: meta.axisSide,
      space: 15,
      child: text,
    );
  }

  BarChartData randomData() {
    return BarChartData(
      barTouchData: BarTouchData(
        enabled: false,
      ),
      titlesData: FlTitlesData(
        show: true,
        bottomTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            getTitlesWidget: getTitles,
            reservedSize: 38,
          ),
        ),
        leftTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: false,
          ),
        ),
        topTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: false,
          ),
        ),
        rightTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: false,
          ),
        ),
      ),
      borderData: FlBorderData(
        show: false,
      ),
      barGroups: List.generate(7, (i) {
        switch (i) {
          case 0:
            return makeGroupData(
              0,
              30,
              barColor: widget.availableColors[
                  Random().nextInt(widget.availableColors.length)],
            );
          case 1:
            return makeGroupData(
              1,
              Random().nextInt(15).toDouble() + 6,
              barColor: widget.availableColors[
                  Random().nextInt(widget.availableColors.length)],
            );
          case 2:
            return makeGroupData(
              2,
              Random().nextInt(15).toDouble() + 6,
              barColor: widget.availableColors[
                  Random().nextInt(widget.availableColors.length)],
            );
          case 3:
            return makeGroupData(
              3,
              Random().nextInt(15).toDouble() + 6,
              barColor: widget.availableColors[
                  Random().nextInt(widget.availableColors.length)],
            );
          case 4:
            return makeGroupData(
              4,
              Random().nextInt(15).toDouble() + 6,
              barColor: widget.availableColors[
                  Random().nextInt(widget.availableColors.length)],
            );
          case 5:
            return makeGroupData(
              5,
              Random().nextInt(15).toDouble() + 6,
              barColor: widget.availableColors[
                  Random().nextInt(widget.availableColors.length)],
            );
          case 6:
            return makeGroupData(
              6,
              Random().nextInt(15).toDouble() + 6,
              barColor: widget.availableColors[
                  Random().nextInt(widget.availableColors.length)],
            );
          default:
            return throw Error();
        }
      }),
      gridData: FlGridData(show: false),
    );
  }
}

extension ColorExtension on Color {
  /// Convert the color to a darken color based on the [percent]
  Color darken([int percent = 40]) {
    assert(1 <= percent && percent <= 100);
    final value = 1 - percent / 100;
    return Color.fromARGB(
      alpha,
      (red * value).round(),
      (green * value).round(),
      (blue * value).round(),
    );
  }
}
