import 'package:demo2/theme/theme.dart';
import 'package:flutter/material.dart';

import '../container/get_started_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch().copyWith(
          primary: AppTheme.colors.basecolor
        ),
      ),
      home: const GetStartedScreen(),
    );
  }
}
