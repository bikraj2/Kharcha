import 'package:demo2/screens/get_started_screen.dart';
import 'package:demo2/services/authservices.dart';
import 'package:demo2/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

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
          title: const Text(_title),
          backgroundColor: AppTheme.colors.basecolor,
        ),
        body: const GetStartedScreen(),
      ),
    );
  }
}
