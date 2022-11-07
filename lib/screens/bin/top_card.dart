import 'package:demo2/theme/theme.dart';
import 'package:flutter/material.dart';

class TopNewCard extends StatelessWidget {
  const TopNewCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 180,
        color: AppTheme.colors.boxcolor,
        child: Center(
            child: Column(
          children: [
            SizedBox(height: 20),
            Text('BALANCE'),
            Text(
              '\$' + '2000',
              style: TextStyle(color: Colors.grey[800], fontSize: 25),
            ),
            SizedBox(
              height: 15,
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
                              style: TextStyle(color: Colors.grey[500])),
                          SizedBox(
                            height: 5,
                          ),
                          Text('\$' + '1500',
                              style: TextStyle(
                                  color: Colors.grey[600],
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
                              style: TextStyle(color: Colors.grey[500])),
                          SizedBox(
                            height: 5,
                          ),
                          Text('\$' + '10000',
                              style: TextStyle(
                                  color: Colors.grey[600],
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
      ),
    );
  }
}
