import 'package:demo2/screens/pages/add_expenses.dart';
import 'package:demo2/theme/theme.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) => Scaffold(
      body: Container(
          padding: EdgeInsets.all(20),
          alignment: Alignment.bottomRight,
          child: CircleAvatar(
            backgroundColor: AppTheme.colors.basecolor,
            radius: 30,
            child: IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => expenseAdder()),
                );
              },
              icon: Icon(Icons.add),
              color: AppTheme.colors.tertiarycolor,
              iconSize: 30,
            ),
          )));
}
