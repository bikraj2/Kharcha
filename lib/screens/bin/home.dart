import 'package:demo2/screens/bin/top_card.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        TopNewCard(),
        Container(
          height: 200,
          color: Colors.blue,
        ),
        Container(
          height: 25,
          child: Center(child: Text('Button')),
        )
      ]),
    );
  }
}
