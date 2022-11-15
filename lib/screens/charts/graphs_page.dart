import 'package:demo2/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../charts/line_chart.dart';
import '../charts/pie_chart.dart';
import '../charts/bar_chart.dart';

class GraphPage extends StatefulWidget {
  const GraphPage({super.key});

  @override
  State<GraphPage> createState() => _GraphPageState();
}

var orientation, width, height, size;

class _GraphPageState extends State<GraphPage> {
  @override
  Widget build(BuildContext context) {
    orientation = MediaQuery.of(context).orientation;
    size = MediaQuery.of(context).size;
    height = size.height;
    width = size.width;
    return Scaffold(
        appBar: AppBar(),
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisSize: MainAxisSize.max,
            verticalDirection: VerticalDirection.down,
            textBaseline: TextBaseline.alphabetic,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (BuildContext) {
                        return PieChartPage();
                      }));
                    },
                    icon: Image.asset("assetss/images/2.png"),
                    iconSize: width / 2.5,
                    color: AppTheme.colors.secondarycolor,
                  ),
                  Container(
                    child: Text(
                        "\n Something about pie chart \n i really love pie chart "),
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Container(
                    height: height / 5,
                    width: width / 1.8,
                  ),
                  IconButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (BuildContext) {
                        return LineChartClass1();
                      }));
                    },
                    icon: Image.asset("assetss/images/3.png"),
                    color: AppTheme.colors.basecolor,
                    iconSize: width / 2.5,
                  ),
                ],
              ),
              Row(children: [
                IconButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (BuildContext) {
                      return BarChartSample1();
                    }));
                  },
                  icon: Image.asset("assetss/images/1.png"),
                  color: AppTheme.colors.secondarycolor,
                  iconSize: width / 2.5,
                ),
              ]),
            ],
          ),
        ));
  }
}
