import 'package:demo2/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:google_fonts/google_fonts.dart';
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
            Container(
              padding: EdgeInsets.only(bottom: 0),
              margin: EdgeInsets.all(10),
              decoration: BoxDecoration(
                  color: AppTheme.colors.backgroundcolor,
                  borderRadius: BorderRadius.circular(40)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (BuildContext) {
                        return PieChartPage();
                      }));
                    },
                    icon: Image.asset("assetss/images/2.png"),
                    iconSize: width / 2.7,
                    color: AppTheme.colors.secondarycolor,
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 0, right: 10),
                    padding: EdgeInsets.all(0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: AppTheme.colors.backgroundcolor,
                    ),
                    child: Text(
                      "Pie chart is a circular statistical \ngraphic divided into slices to \nillustrate a numerical proportion.\nYou can view the expenses \nusing the chart and find their \nproportions ",
                      style: GoogleFonts.lato(
                          fontSize: 13,
                          color: AppTheme.colors.secondarycolor,
                          fontWeight: FontWeight.w400),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.only(bottom: 0),
              margin: EdgeInsets.all(10),
              decoration: BoxDecoration(
                  color: AppTheme.colors.backgroundcolor,
                  borderRadius: BorderRadius.circular(40)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (BuildContext) {
                        return LineChartSample2();
                      }));
                    },
                    icon: Image.asset("assetss/images/3.png"),
                    iconSize: width / 2.7,
                    color: AppTheme.colors.secondarycolor,
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 0, right: 10),
                    padding: EdgeInsets.all(0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: AppTheme.colors.backgroundcolor,
                    ),
                    child: Text(
                      "Line Chart is a circular statistical \ngraphic divided into slices to \nillustrate a numerical proportion.\nYou can view the expenses \nusing the chart and find their \nproportions ",
                      style: GoogleFonts.lato(
                          fontSize: 13,
                          color: AppTheme.colors.secondarycolor,
                          fontWeight: FontWeight.w400),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.only(bottom: 0),
              margin: EdgeInsets.all(10),
              decoration: BoxDecoration(
                  color: AppTheme.colors.backgroundcolor,
                  borderRadius: BorderRadius.circular(40)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (BuildContext) {
                        return BarChartSample1();
                      }));
                    },
                    icon: Image.asset("assetss/images/1.png"),
                    iconSize: width / 2.7,
                    color: AppTheme.colors.secondarycolor,
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 0, right: 10),
                    padding: EdgeInsets.all(0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: AppTheme.colors.backgroundcolor,
                    ),
                    child: Text(
                      "Bar chart is a circular statistical \ngraphic divided into slices to \nillustrate a numerical proportion.\nYou can view the expenses \nusing the chart and find their \nproportions ",
                      style: GoogleFonts.lato(
                          fontSize: 13,
                          color: AppTheme.colors.secondarycolor,
                          fontWeight: FontWeight.w400),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
