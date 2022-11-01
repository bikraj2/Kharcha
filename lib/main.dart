import 'package:demo2/screens/container/get_started_screen.dart';
import 'package:demo2/services/authservices.dart';
import 'package:demo2/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);
  // var orientation, size, height, width;
  var orientation, size, height, width;
  static const String _title = 'Welcome';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowMaterialGrid: false,
      debugShowCheckedModeBanner: false,
      title: _title,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch()
            .copyWith(primary: AppTheme.colors.basecolor),
      ),
      home: Scaffold(
        appBar: AppBar(
          toolbarHeight: 35,
          title: const Text(
            _title,
            style: TextStyle(fontSize: 18),
          ),
          backgroundColor: AppTheme.colors.basecolor,
        ),
        body: GetStartedScreen(),
      ),
    );
  }
}
