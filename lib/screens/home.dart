import './pages/add_expenses.dart';
import 'package:demo2/screens/top_card.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import './log/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../theme/theme.dart';



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
// Expanded(
//                 child: Container(
//               height: 40,
//               child: Text('Transactions'),
//             )),
//             Container(
//               height: 25,
//               child: GestureDetector(
//                 child: Container(
//                   padding: EdgeInsets.all(10),
//                   alignment: Alignment.center,
//                   height: 60,
//                   width: 60,
//                   decoration: BoxDecoration(
//                     color: Colors.grey[500],
//                     shape: BoxShape.circle,
//                   ),
//                   child: Center(
//                     child: Text(
//                       '+',
//                       style: TextStyle(color: Colors.white, fontSize: 25),
//                     ),
//                   ),
//                 ),
//               ),
//             ),