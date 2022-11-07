import 'dart:ffi';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:intl/intl.dart';

import '../../models/expenses.dart';
import 'package:demo2/token/token.dart';
import 'package:demo2/services/authservices.dart';

List<Expense> expenseList = [];

class BarChartSample1 extends StatefulWidget {
  const BarChartSample1({super.key});

  List<Color> get availableColors => const <Color>[
        Colors.purpleAccent,
        Colors.yellow,
        Colors.lightBlue,
        Colors.orange,
        Colors.pink,
        Colors.redAccent,
      ];

  @override
  State<StatefulWidget> createState() => BarChartSample1State();
}

class BarChartSample1State extends State<BarChartSample1> {
  Future<List<Expense>> getData() async {
    try {
      var tk = await token.storage.read(key: 'jwt');
      final res = await AuthService().getExpense(tk);
      for (Map i in res.data['ans']) {
        expenseList.add(Expense(
            amount: double.parse(i['amount'].toString()),
            name: i['name'],
            date1: DateTime.parse(i['date']).toLocal(),
            category: i['category']));
      }
      return expenseList;
    } catch (e) {
      throw e;
    }
  }

  final Color barBackgroundColor = const Color(0xff72d8bf);
  final Duration animDuration = const Duration(milliseconds: 250);
  bool isLoading = true;
  int touchedIndex = -1;

  bool isPlaying = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: AspectRatio(
        aspectRatio: MediaQuery.of(context).size.width /
            MediaQuery.of(context).size.width.toDouble(),
        child: Card(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
          color: const Color(0xff81e5cd),
          child: Stack(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    const Text(
                      'BarChart',
                      style: TextStyle(
                        color: Color(0xff0f4a3c),
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    const Text(
                      'Your Weekly Expenses ',
                      style: TextStyle(
                        color: Color(0xff379982),
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                      height: 38,
                    ),
                    Expanded(
                        child: FutureBuilder(
                            future: getData(),
                            builder: (context, snapshot) {
                              return BarChart(mainBarData());
                            })),
                    const SizedBox(
                      height: 12,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  BarChartGroupData makeGroupData(
    int x,
    double y, {
    bool isTouched = false,
    Color barColor = Colors.white,
    double width = 22,
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
              : const BorderSide(color: Colors.white, width: 0),
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
    expenseList.map((val) {
      print(val.amount);
    });
    return List.generate(7, (i) {
      switch (i) {
        case 0:
          return makeGroupData(0, expenseList[6].amount as double,
              isTouched: i == touchedIndex);
        case 1:
          return makeGroupData(1, expenseList[5].amount as double,
              isTouched: i == touchedIndex);
        case 2:
          return makeGroupData(2, expenseList[4].amount as double,
              isTouched: i == touchedIndex);
        case 3:
          return makeGroupData(3, expenseList[3].amount as double,
              isTouched: i == touchedIndex);
        case 4:
          return makeGroupData(4, expenseList[2].amount as double,
              isTouched: i == touchedIndex);
        case 5:
          return makeGroupData(5, expenseList[1].amount as double,
              isTouched: i == touchedIndex);
        case 6:
          return makeGroupData(6, expenseList[0].amount as double,
              isTouched: i == touchedIndex);
        default:
          return throw Error();
      }
    });
  }

  BarChartData mainBarData() {
    double total = value;
    print(total);
    return BarChartData(
      barTouchData: BarTouchData(
        touchTooltipData: BarTouchTooltipData(
          tooltipBgColor: Color.fromARGB(255, 201, 138, 90),
          getTooltipItem: (group, groupIndex, rod, rodIndex) {
            String weekDay;
            switch (group.x) {
              case 0:
                weekDay = 'Sunday';
                break;
              case 1:
                weekDay = 'Monday';
                break;
              case 2:
                weekDay = 'Tuesday';
                break;
              case 3:
                weekDay = 'Wednesday';
                break;
              case 4:
                weekDay = 'Thursday';
                break;
              case 5:
                weekDay = 'Friday';
                break;
              case 6:
                weekDay = 'Saturday';
                break;
              default:
                throw Error();
            }
            return BarTooltipItem(
              '$weekDay\n',
              const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
              children: <TextSpan>[
                TextSpan(
                  text: (rod.toY - 1).toString(),
                  style: const TextStyle(
                    color: Colors.yellow,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            );
          },
        ),
        touchCallback: (FlTouchEvent event, barTouchResponse) {
          setState(() {
            if (!event.isInterestedForInteractions ||
                barTouchResponse == null ||
                barTouchResponse.spot == null) {
              touchedIndex = -1;
              return;
            }
            touchedIndex = barTouchResponse.spot!.touchedBarGroupIndex;
          });
        },
      ),
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
      color: Colors.white,
      fontWeight: FontWeight.bold,
      fontSize: 14,
    );
    Widget text;
    switch (value.toInt()) {
      case 0:
        String temp = groupedTransactionValues[6]['day'] as String;
        text = Text(temp, style: style);
        break;
      case 1:
        String temp = groupedTransactionValues[5]['day'] as String;
        text = Text(temp, style: style);
        break;
      case 2:
        String temp = groupedTransactionValues[4]['day'] as String;
        text = Text(temp, style: style);
        break;
      case 3:
        String temp = groupedTransactionValues[3]['day'] as String;
        text = Text(temp, style: style);
        break;
      case 4:
        String temp = groupedTransactionValues[2]['day'] as String;
        text = Text(temp, style: style);
        break;
      case 5:
        String temp = groupedTransactionValues[1]['day'] as String;
        text = Text(temp, style: style);
        break;
      case 6:
        String temp = groupedTransactionValues[0]['day'] as String;
        text = Text(temp, style: style);
        break;
      default:
        text = const Text('', style: style);
        break;
    }
    return SideTitleWidget(
      axisSide: meta.axisSide,
      space: 16,
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

  Future<dynamic> refreshState() async {
    setState(() {});
    await Future<dynamic>.delayed(
      animDuration + const Duration(milliseconds: 50),
    );
    if (isPlaying) {
      await refreshState();
    }
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

List<Map<String, Object>> get groupedTransactionValues {
  return List.generate(7, (index) {
    final weekday = DateTime.now().subtract(
      Duration(days: index),
    );
    var totalSum = 0.0;
    for (var i = 0; i < expenseList.length; i++) {
      if (expenseList[i].date?.day == weekday.day &&
          expenseList[i].date?.month == weekday.month &&
          expenseList[i].date?.year == weekday.year) {
        totalSum += expenseList[i].amount as double;
      }
    }
    return {'day': DateFormat.E().format(weekday)[0], 'amount': totalSum};
  });
}

double get value {
  double max = 0;
  groupedTransactionValues.map((data) {
    if (data['amount'] as double > max) {
      max = data['amount'] as double;
    }
  });
  return max;
}
