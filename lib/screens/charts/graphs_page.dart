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
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisSize: MainAxisSize.max,
          verticalDirection: VerticalDirection.down,
          textBaseline: TextBaseline.alphabetic,
          children: [
            Row(
              children: [
                Container(
                  color: Colors.white,
                  child: IconButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (BuildContext) {
                        return PieChartPage();
                      }));
                    },
                    icon: Image(image: AssetImage("assetss/images/pie.png")),
                    iconSize: width / 2.5,
                    // child: Container(
                    //     height: height / 4.5,
                    //     width: width / 3,
                    //     decoration: const BoxDecoration(
                    //         color: Colors.white,
                    //         image: DecorationImage(
                    //           image: AssetImage('assetss/images/pie.png'),
                    //           fit: BoxFit.cover,
                    //         ))),
                  ),
                ),
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
                Container(
                  child: IconButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (BuildContext) {
                        return LineChartClass1();
                      }));
                    },
                    icon: Image(image: AssetImage("assetss/images/chart.png")),
                    iconSize: width / 2.5,
                    // child: Container(
                    //     height: height / 4.5,
                    //     width: width / 4,
                    //     decoration: const BoxDecoration(
                    //         image: DecorationImage(
                    //             image: AssetImage('assetss/images/chart.png'),
                    //             fit: BoxFit.cover)))
                  ),
                ),
              ],
            ),
            Row(children: [
              Container(
                child: IconButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (BuildContext) {
                      return BarChartSample1();
                    }));
                  },
                  icon: Image(image: AssetImage("assetss/images/pie.png")),
                  iconSize: width / 2.5,
                  // child: Container(
                  //     height: height / 4.5,
                  //     width: width / 4,
                  //     decoration: const BoxDecoration(
                  //         image: DecorationImage(
                  //             image: AssetImage('assetss/images/pie.png'),
                  //             fit: BoxFit.cover)))
                ),
              )
            ]),
          ],
        ));
  }
}
