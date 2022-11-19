import 'package:demo2/main.dart';
import 'package:demo2/models/expenseList.dart';
import 'package:demo2/services/authservices.dart';
import 'package:demo2/theme/theme.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:basic_utils/basic_utils.dart';
import 'package:demo2/token/token.dart';
import 'package:quiver/time.dart';

List<Color> gradientColors = [
  AppTheme.colors.basecolor,
  AppTheme.colors.boxcolor,
];
LineChartData choice = 0 as LineChartData;
// import 'package:basic_utils/basic_utils.dart';

class LineChartClass1 extends StatelessWidget {
  const LineChartClass1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Your Monthly Expenses"),
        backgroundColor: AppTheme.colors.secondarycolor,
      ),
      body: LineChartSample2(),
    );
  }
}

class LineChartSample2 extends StatefulWidget {
  const LineChartSample2({super.key});

  @override
  State<LineChartSample2> createState() => _LineChartSample2State();
}

class _LineChartSample2State extends State<LineChartSample2> {
  var a = ExpenseList.getData();
  var weeklineChartdata = ExpenseList.groupedData;
  List<double> flspotarray = ExpenseList.weeklyarraylist() as List<double>;

  int check = 0;
  @override
  Widget build(BuildContext context) {
    print(flspotarray);
    LineChartData dataForGraph = mainData();

    switch (check) {
      case 0:
        dataForGraph = mainData();
        break;
      case 1:
        dataForGraph = monthData();
        break;
      case 2:
        dataForGraph = yearData();
        break;
    }
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: <Widget>[
            AspectRatio(
              aspectRatio: 1.2,
              child: DecoratedBox(
                decoration: const BoxDecoration(
                  color: Color(0xff232d37),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(
                    right: 25,
                    left: 25,
                    top: 25,
                    bottom: 25,
                  ),
                  child: LineChart(dataForGraph

                      //cant seem to solve the issue of trying to display different data without refreshing the page .
                      ),
                ),
              ),
              child: LineChart(dataForGraph

                  //cant seem to solve the issue of trying to display different data without refreshing the page .
                  ),
            ),
            ElevatedButton(
              child: Padding(padding: EdgeInsets.all(10), child: Text("change")),
              onPressed: () {
                setState(() {
                  check = check + 1;
                  check = check % 3;
                });
              },
            ),
            ElevatedButton(
                onPressed: () async {
                  // ExpenseList.getMonthData('2022-01').then((value) {
                  //   ExpenseList.groupMonthlyValues(2022, 01, daysInMonth(2022, 01));
                  // });
                  // print(ExpenseList.monthlyArrayList());
                  // ExpenseList.getMonthData('2022-02').then((value) {
                  //   ExpenseList.groupMonthlyValues(2022, 02, daysInMonth(2022, 02));
                  // });
                  // print(ExpenseList.monthlyArrayList());
                  // ExpenseList.getMonthData('2022-03').then((value) {
                  //   ExpenseList.groupMonthlyValues(2022, 03, daysInMonth(2022, 03));
                  // });
                  // print(ExpenseList.monthlyArrayList());
                  // ExpenseList.getMonthData('2022-04').then((value) {
                  //   ExpenseList.groupMonthlyValues(2022, 04, daysInMonth(2022, 04));
                  // });
                  // print(ExpenseList.monthlyArrayList());
                  // ExpenseList.getMonthData('2022-05').then((value) {
                  //   ExpenseList.groupMonthlyValues(2022, 05, daysInMonth(2022, 05));
                  // });
                  // print(ExpenseList.monthlyArrayList());
                  // ExpenseList.getMonthData('2022-06').then((value) {
                  //   ExpenseList.groupMonthlyValues(2022, 06, daysInMonth(2022, 06));
                  // });
                  // print(ExpenseList.monthlyArrayList());
                  // ExpenseList.getMonthData('2022-07').then((value) {
                  //   ExpenseList.groupMonthlyValues(2022, 07, daysInMonth(2022, 07));
                  // });
                  // print(ExpenseList.monthlyArrayList());

                  // ExpenseList.getMonthData('2022-08').then((value) {
                  //   ExpenseList.groupMonthlyValues(2022, 08, daysInMonth(2022, 08));
                  // });
                  // print(ExpenseList.monthlyArrayList());
                  // ExpenseList.getMonthData('2022-09').then((value) {
                  //   ExpenseList.groupMonthlyValues(2022, 09, daysInMonth(2022, 09));
                  // });
                  // print(ExpenseList.monthlyArrayList());
                  try {
                    var value = await ExpenseList.getMonthData('2022-10');

                    setState(() {});
                    // print(ExpenseList.groupMonthlyValues(
                    //     2022, 10, daysInMonth(2022, 10)));
                  } catch (e) {}
                  // print(ExpenseList.monthlyArrayList());
                  // ExpenseList.getMonthData('2022-11').then((value) {
                  //   print(ExpenseList.groupMonthlyValues(
                  //       2022, 11, daysInMonth(2022, 11)));
                  // });
                  // print(ExpenseList.monthlyArrayList());
                  // ExpenseList.getMonthData('2022-12').then((value) {
                  //   ExpenseList.groupMonthlyValues(2022, 12, daysInMonth(2022, 12));
                  // });
                  // print(ExpenseList.monthlyArrayList());
                },
                child: const Text("MonthTrigger")),
            ElevatedButton(
                onPressed: () async {
                  var value1 = await ExpenseList.getYearData('2022');

                  setState(() {});
                },
                child: Text("YearTrigger")),
            ElevatedButton(
                onPressed: () {
                  try {
                    // print(ExpenseList.groupMonthlyValues(
                    //     2022, 10, daysInMonth(2022, 10)));
                  } catch (e) {}
                },
                child: Text(ExpenseList.monthName(ExpenseList.month))),
          ],
        ),
      ),
    );
  }

  Widget bottomTitleWidgets(double value, TitleMeta meta) {
    const style = TextStyle(
      color: Color(0xff68737d),
      fontWeight: FontWeight.bold,
      fontSize: 12,
    );
    String temp1 = weeklineChartdata[6]['day'].toString();
    String temp2 = weeklineChartdata[5]['day'].toString();
    String temp3 = weeklineChartdata[4]['day'].toString();
    String temp4 = weeklineChartdata[3]['day'].toString();
    String temp5 = weeklineChartdata[2]['day'].toString();
    String temp6 = weeklineChartdata[1]['day'].toString();
    String temp7 = weeklineChartdata[0]['day'].toString();

    Widget text;
    switch (value.toInt()) {
      case 0:
        text = Text(temp1[0], style: style);
        break;
      case 1:
        text = Text(temp2[0], style: style);
        break;
      case 2:
        text = Text(temp3[0], style: style);
        break;
      case 3:
        text = Text(temp4[0], style: style);
        break;
      case 4:
        text = Text(temp5[0], style: style);
        break;
      case 5:
        text = Text(temp6[0], style: style);
        break;
      case 6:
        text = Text(temp7[0], style: style);
        break;

      default:
        text = const Text('', style: style);
        break;
    }

    return SideTitleWidget(
      axisSide: meta.axisSide,
      child: text,
    );
  }

  Widget leftTitleWidgets(double value, TitleMeta meta) {
    const style = TextStyle(
      color: Color(0xff67727d),
      fontWeight: FontWeight.bold,
      fontSize: 12,
    );

    String text;

    switch (value.toInt()) {
      case 0:
        text = '0';
        break;

      case 1:
        text = ExpenseList.zeros(ExpenseList.weektemp * .2);
        break;
      case 2:
        text = ExpenseList.zeros(ExpenseList.weektemp * .4);
        break;
      case 3:
        text = ExpenseList.zeros(ExpenseList.weektemp * .6);
        break;
      case 4:
        text = ExpenseList.zeros(ExpenseList.weektemp * .8);

        break;
      case 5:
        text = ExpenseList.zeros(ExpenseList.weektemp);
        break;
      case 6:
        text = ExpenseList.zeros(ExpenseList.weektemp * 1.2);
        break;

      default:
        return Container();
    }

    return Text(text, style: style, textAlign: TextAlign.left);
  }

  LineChartData mainData() {
    return LineChartData(
      lineTouchData: LineTouchData(
          enabled: true,
          touchTooltipData: LineTouchTooltipData(
            getTooltipItems: (touchedSpots) {
              return List.generate(touchedSpots.length, (index) {
                return LineTooltipItem(
                    (touchedSpots[index].y * ExpenseList.weektemp / 6)
                        .toString(),
                    TextStyle(
                      fontSize: 12,
                      color: Colors.white,
                    ));
              });
            },
          )),
      gridData: FlGridData(
        show: true,
        drawVerticalLine: true,
        horizontalInterval: 1,
        verticalInterval: 1,
        getDrawingHorizontalLine: (value) {
          return FlLine(
            color: const Color(0xff37434d),
            strokeWidth: 1.5,
          );
        },
        getDrawingVerticalLine: (value) {
          return FlLine(
            color: const Color(0xff37434d),
            strokeWidth: 1.5,
          );
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
            reservedSize: 30,
            interval: 1,
            getTitlesWidget: bottomTitleWidgets,
          ),
        ),
        leftTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            interval: 1,
            getTitlesWidget: leftTitleWidgets,
            reservedSize: 42,
          ),
        ),
      ),
      borderData: FlBorderData(
        show: true,
        border: Border.all(color: const Color(0xff37434d)),
      ),
      minX: 0,
      maxX: 6,
      minY: 0,
      maxY: 6,
      lineBarsData: [
        LineChartBarData(
          spots: [
            // ...List.generate(ExpenseList.groupedData.length, (index) {
            //   return FlSpot(
            //       index.toDouble(),
            //       (ExpenseList.groupedData[index]['amount'] as double) *
            //           6 /
            //           ExpenseList.weektemp);
            // })
            FlSpot(0, flspotarray[6] * 6 / ExpenseList.weektemp),
            FlSpot(1, flspotarray[5] * 6 / ExpenseList.weektemp),
            FlSpot(2, flspotarray[4] * 6 / ExpenseList.weektemp),
            FlSpot(3, flspotarray[3] * 6 / ExpenseList.weektemp),
            FlSpot(4, flspotarray[2] * 6 / ExpenseList.weektemp),
            FlSpot(5, flspotarray[1] * 6 / ExpenseList.weektemp),
            FlSpot(6, flspotarray[0] * 6 / ExpenseList.weektemp),
          ],
          isCurved: false,
          color: Colors.white,
          barWidth: 3,
          isStrokeCapRound: true,
          dotData: FlDotData(
            show: false,
          ),
          belowBarData: BarAreaData(
            show: true,
            gradient: LinearGradient(
              colors: gradientColors
                  .map((color) => color.withOpacity(0.3))
                  .toList(),
            ),
          ),
        ),
      ],
    );
  }
}

LineChartData monthData() {
  return LineChartData(
    lineTouchData: LineTouchData(
        enabled: true,
        touchTooltipData: LineTouchTooltipData(
          getTooltipItems: (touchedSpots) {
            return List.generate(touchedSpots.length, (index) {
              return LineTooltipItem(
                  (touchedSpots[index].y * ExpenseList.monthtemp / 6)
                      .toString(),
                  TextStyle(
                    fontSize: 12,
                  ));
            });
          },
        )),
    gridData: FlGridData(
      show: true,
      drawVerticalLine: true,
      horizontalInterval: 1,
      verticalInterval: 1,
      getDrawingHorizontalLine: (value) {
        return FlLine(
          color: const Color(0xff37434d),
          strokeWidth: 1.5,
        );
      },
      getDrawingVerticalLine: (value) {
        return FlLine(
          color: const Color(0xff37434d),
          strokeWidth: 1.5,
        );
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
          reservedSize: 30,
          interval: 1,
          getTitlesWidget: bottomTitlemonthWidgets,
        ),
      ),
      leftTitles: AxisTitles(
        sideTitles: SideTitles(
          showTitles: true,
          interval: 1,
          getTitlesWidget: leftTitlemonthWidgets,
          reservedSize: 42,
        ),
      ),
    ),
    borderData: FlBorderData(
      show: true,
      border: Border.all(color: const Color(0xff37434d)),
    ),
    minX: 0,
    maxX: 7,
    minY: 0,
    maxY: 6,
    lineBarsData: [
      LineChartBarData(
        spots: [
          ...List.generate(ExpenseList.monthgroupedData.length, (index) {
            return FlSpot(
                index.toDouble() / 5,
                (ExpenseList.monthgroupedData[index]['amount'] as double) *
                    6 /
                    ExpenseList.monthtemp);
          })
        ],
        isCurved: false,
        color: Colors.white,
        barWidth: 1,
        isStrokeCapRound: false,
        dotData: FlDotData(
          show: false,
        ),
        belowBarData: BarAreaData(
          show: true,
          gradient: LinearGradient(
            colors:
                gradientColors.map((color) => color.withOpacity(0.3)).toList(),
          ),
        ),
      ),
    ],
  );
}

Widget leftTitlemonthWidgets(double value, TitleMeta meta) {
  const style = TextStyle(
    color: Color(0xff67727d),
    fontWeight: FontWeight.bold,
    fontSize: 12,
  );
  String text;

  switch (value.toInt()) {
    case 0:
      text = '0';
      break;
    case 1:
      text = ExpenseList.zeros(ExpenseList.monthtemp * .2);
      break;
    case 2:
      text = ExpenseList.zeros(ExpenseList.monthtemp * .4);
      break;
    case 3:
      text = ExpenseList.zeros(ExpenseList.monthtemp * .6);
      break;
    case 4:
      text = ExpenseList.zeros(ExpenseList.monthtemp * .8);
      break;
    case 5:
      text = ExpenseList.zeros(ExpenseList.monthtemp);
      break;
    case 6:
      text = ExpenseList.zeros(ExpenseList.monthtemp * 1.2);
      break;

    default:
      return Container();
  }

  return Text(text, style: style, textAlign: TextAlign.left);
}

Widget bottomTitlemonthWidgets(double value, TitleMeta meta) {
  const style = TextStyle(
    color: Color(0xff68737d),
    fontWeight: FontWeight.bold,
    fontSize: 12,
  );

  Widget text;
  switch (value.toInt()) {
    case 0:
      text = Text("0", style: style);
      break;
    case 1:
      text = Text("5th", style: style);
      break;
    case 2:
      text = Text("10th", style: style);
      break;
    case 3:
      text = Text("15th", style: style);
      break;
    case 4:
      text = Text("20th", style: style);
      break;
    case 5:
      text = Text("25th", style: style);
      break;
    case 6:
      text = Text("30th", style: style);
      break;
    case 7:
      text = Text("35th", style: style);
      break;
    default:
      text = const Text('', style: style);
      break;
  }

  return SideTitleWidget(
    axisSide: meta.axisSide,
    child: text,
  );
}

LineChartData yearData() {
  return LineChartData(
    lineTouchData: LineTouchData(
        enabled: true,
        touchTooltipData: LineTouchTooltipData(
          getTooltipItems: (touchedSpots) {
            return List.generate(touchedSpots.length, (index) {
              return LineTooltipItem(
                  (touchedSpots[index].y * ExpenseList.yeartemp / 6).toString(),
                  TextStyle(
                    fontSize: 12,
                  ));
            });
          },
        )),
    gridData: FlGridData(
      show: true,
      drawVerticalLine: true,
      horizontalInterval: 1,
      verticalInterval: 1,
      getDrawingHorizontalLine: (value) {
        return FlLine(
          color: const Color(0xff37434d),
          strokeWidth: 1.5,
        );
      },
      getDrawingVerticalLine: (value) {
        return FlLine(
          color: const Color(0xff37434d),
          strokeWidth: 1.5,
        );
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
          reservedSize: 30,
          interval: 1,
          getTitlesWidget: bottomTitleYearWidgets,
        ),
      ),
      leftTitles: AxisTitles(
        sideTitles: SideTitles(
          showTitles: true,
          interval: 1,
          getTitlesWidget: leftTitleYearWidgets,
          reservedSize: 42,
        ),
      ),
    ),
    borderData: FlBorderData(
      show: true,
      border: Border.all(color: const Color(0xff37434d)),
    ),
    minX: 0,
    maxX: 11,
    minY: 0,
    maxY: 6,
    lineBarsData: [
      LineChartBarData(
        spots: [
          ...List.generate(ExpenseList.yeargroupedData.length, (index) {
            return FlSpot(
                index.toDouble(),
                (ExpenseList.yeargroupedData[index]['amount'] as double) *
                    6 /
                    ExpenseList.yeartemp);
          })
        ],
        isCurved: false,
        gradient: LinearGradient(colors: gradientColors),
        barWidth: 3,
        isStrokeCapRound: true,
        dotData: FlDotData(
          show: false,
        ),
        belowBarData: BarAreaData(
          show: true,
          gradient: LinearGradient(
            colors:
                gradientColors.map((color) => color.withOpacity(0.3)).toList(),
          ),
        ),
      ),
    ],
  );
}

Widget leftTitleYearWidgets(double value, TitleMeta meta) {
  const style = TextStyle(
    color: Color(0xff67727d),
    fontWeight: FontWeight.bold,
    fontSize: 12,
  );

  String text;

  switch (value.toInt()) {
    case 0:
      text = '0';
      break;

    case 1:
      text = ExpenseList.zeros(ExpenseList.yeartemp * .2);
      break;
    case 2:
      text = ExpenseList.zeros(ExpenseList.yeartemp * .4);
      break;
    case 3:
      text = ExpenseList.zeros(ExpenseList.yeartemp * .6);
      break;
    case 4:
      text = ExpenseList.zeros(ExpenseList.yeartemp * .8);
      break;
    case 5:
      text = ExpenseList.zeros(ExpenseList.yeartemp);
      break;
    case 6:
      text = ExpenseList.zeros(ExpenseList.yeartemp * 1.2);
      break;

    default:
      return Container();
  }

  return Text(text, style: style, textAlign: TextAlign.left);
}

Widget bottomTitleYearWidgets(double value, TitleMeta meta) {
  const style = TextStyle(
    color: Color(0xff68737d),
    fontWeight: FontWeight.bold,
    fontSize: 12,
  );

  Widget text;
  switch (value.toInt()) {
    case 0:
      text = Text("Jan", style: style);
      break;
    case 1:
      text = Text("Feb", style: style);
      break;
    case 2:
      text = Text("Mar", style: style);
      break;
    case 3:
      text = Text("Apr", style: style);
      break;
    case 4:
      text = Text("May", style: style);
      break;
    case 5:
      text = Text("June", style: style);
      break;
    case 6:
      text = Text("July", style: style);
      break;
    case 7:
      text = Text("Aug", style: style);
      break;
    case 8:
      text = Text("Sep", style: style);
      break;
    case 9:
      text = Text("Oct", style: style);
      break;
    case 10:
      text = Text("Nov", style: style);
      break;
    case 11:
      text = Text("Dec", style: style);
      break;

    default:
      text = const Text('', style: style);
      break;
  }

  return SideTitleWidget(
    axisSide: meta.axisSide,
    child: text,
  );
}
