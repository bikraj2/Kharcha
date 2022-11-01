<<<<<<< HEAD
=======
import 'dart:ui';

>>>>>>> master
import 'package:demo2/theme/theme.dart';
import 'package:flutter/material.dart';

class TopNewCard extends StatelessWidget {
  const TopNewCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
<<<<<<< HEAD
        height: 180,
        color: AppTheme.colors.boxcolor,
        child: Center(
            child: Column(
          children: [
            SizedBox(height: 20),
            Text('BALANCE'),
=======
        height: 200,
        margin: EdgeInsets.all(10),
        child: Center(
            child: Column(
          children: [
            SizedBox(
              height: 30,
            ),
            Text(
              'B A L A N C E',
              style: TextStyle(color: Colors.grey[500]),
            ),
            SizedBox(
              height: 10,
            ),
>>>>>>> master
            Text(
              '\$' + '2000',
              style: TextStyle(color: Colors.grey[800], fontSize: 25),
            ),
            SizedBox(
<<<<<<< HEAD
              height: 15,
=======
              height: 20,
>>>>>>> master
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Container(
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.grey[200],
                        ),
                        child: Center(
                          child: Icon(
                            Icons.arrow_upward,
                            color: Colors.green,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Income',
<<<<<<< HEAD
                              style: TextStyle(color: Colors.grey[500])),
=======
                              style: TextStyle(color: Colors.grey[600])),
>>>>>>> master
                          SizedBox(
                            height: 5,
                          ),
                          Text('\$' + '1500',
                              style: TextStyle(
<<<<<<< HEAD
                                  color: Colors.grey[600],
=======
                                  color: Colors.grey[700],
>>>>>>> master
                                  fontWeight: FontWeight.bold)),
                        ],
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Container(
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.grey[200],
                        ),
                        child: Center(
                          child: Icon(
                            Icons.arrow_downward,
                            color: Colors.red,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Expense',
<<<<<<< HEAD
                              style: TextStyle(color: Colors.grey[500])),
=======
                              style: TextStyle(color: Colors.grey[600])),
>>>>>>> master
                          SizedBox(
                            height: 5,
                          ),
                          Text('\$' + '10000',
                              style: TextStyle(
<<<<<<< HEAD
                                  color: Colors.grey[600],
=======
                                  color: Colors.grey[700],
>>>>>>> master
                                  fontWeight: FontWeight.bold)),
                        ],
                      )
                    ],
                  )
                ],
              ),
            ),
          ],
        )),
<<<<<<< HEAD
=======
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: Colors.grey[300],
            boxShadow: [
              BoxShadow(
                  color: Colors.grey.shade500,
                  offset: Offset(4.0, 4.0),
                  blurRadius: 15.0,
                  spreadRadius: 1.0),
              BoxShadow(
                  color: Colors.white,
                  offset: Offset(-4.0, -4.0),
                  blurRadius: 15.0,
                  spreadRadius: 1.0),
            ]),
>>>>>>> master
      ),
    );
  }
}
