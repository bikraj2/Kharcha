import 'package:demo2/models/expenseList.dart';
import 'package:demo2/theme/theme.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:basic_utils/basic_utils.dart';

class LineChartClass1 extends StatelessWidget {
  const LineChartClass1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:const Text("Your Monthly Expenses"),
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
  List<Color> gradientColors = [
    AppTheme.colors.basecolor,
    AppTheme.colors.boxcolor,
  ];

  var lineChartdata = ExpenseList.groupedData;
  bool showAvg = false;
  List<double> flspotarray = ExpenseList.arraylist() as List<double>;

  @override
  Widget build(BuildContext context) {
    print(lineChartdata);

    return Stack(
      children: <Widget>[
        AspectRatio(
          aspectRatio: 16.0 / 9.0,
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
              child: LineChart(
                mainData(),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget bottomTitleWidgets(double value, TitleMeta meta) {
    const style = TextStyle(
      color: Color(0xff68737d),
      fontWeight: FontWeight.bold,
      fontSize: 16,
    );
    String temp1 = lineChartdata[6]['day'].toString();
    String temp2 = lineChartdata[5]['day'].toString();
    String temp3 = lineChartdata[4]['day'].toString();
    String temp4 = lineChartdata[3]['day'].toString();
    String temp5 = lineChartdata[2]['day'].toString();
    String temp6 = lineChartdata[1]['day'].toString();
    String temp7 = lineChartdata[0]['day'].toString();

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
      fontSize: 15,
    );

    String text;

    switch (value.toInt()) {
      case 0:
        text = '0';
        break;

      case 1:
        text = ExpenseList.zeros(ExpenseList.temp * .2);
        break;
      case 2:
        text = ExpenseList.zeros(ExpenseList.temp * .4);
        break;
      case 3:
        text = ExpenseList.zeros(ExpenseList.temp * .6);
        break;
      case 4:
        text = ExpenseList.zeros(ExpenseList.temp * .8);
        
        break;
      case 5:
        text = ExpenseList.zeros(ExpenseList.temp);
        break;
      case 6:
        text = ExpenseList.zeros(ExpenseList.temp * 1.2);
        break;

      default:
        return Container();
    }

    return Text(text, style: style, textAlign: TextAlign.left);
  }

  LineChartData mainData() {
    return LineChartData(
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
            FlSpot(0, flspotarray[6] * 5 / ExpenseList.temp),
            FlSpot(1, flspotarray[5] * 5 / ExpenseList.temp),
            FlSpot(2, flspotarray[4] * 5 / ExpenseList.temp),
            FlSpot(3, flspotarray[3] * 5 / ExpenseList.temp),
            FlSpot(4, flspotarray[2] * 5 / ExpenseList.temp),
            FlSpot(5, flspotarray[1] * 5 / ExpenseList.temp),
            FlSpot(6, flspotarray[0] * 5 / ExpenseList.temp),
          ],
          isCurved: false,
          gradient: LinearGradient(
            colors: gradientColors,
          ),
          barWidth: 5,
          isStrokeCapRound: true,
          dotData: FlDotData(
            show: true,
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
