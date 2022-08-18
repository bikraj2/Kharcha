import 'package:demo2/screens/top_card.dart';
import 'package:flutter/material.dart';

import '../theme/theme.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;
  final tabs = [
    Column(children: [
      SizedBox(
        height: 10,
      ),
      TopNewCard(),
      Expanded(
          child: Container(
        child: Center(
            child: Column(
          children: [
            SizedBox(
              height: 10,
            ),
            ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Container(
                  padding: EdgeInsets.all(8),
                  color: Colors.grey[200],
                  height: 50,
                  child: Center(
                      child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Transaction name'),
                      Text('\$ 200'),
                    ],
                  )),
                )),
            SizedBox(
              height: 10,
            ),
            ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Container(
                  padding: EdgeInsets.all(8),
                  color: Colors.grey[200],
                  height: 50,
                  child: Center(
                      child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Transaction name'),
                      Text('\$ 200'),
                    ],
                  )),
                )),
            SizedBox(
              height: 10,
            ),
            ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Container(
                  padding: EdgeInsets.all(8),
                  color: Colors.grey[200],
                  height: 50,
                  child: Center(
                      child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Transaction name'),
                      Text('\$ 200'),
                    ],
                  )),
                ))
          ],
        )),
      )),
      Container(
          height: 100,
          child: Center(
              child: Container(
                  padding: EdgeInsets.all(10),
                  alignment: Alignment.bottomCenter,
                  height: 75,
                  width: 75,
                  decoration: BoxDecoration(
                    color: Colors.grey[500],
                    shape: BoxShape.circle,
                  ),
                  child: Center(
                    child: Text(
                      '+',
                      style: TextStyle(color: Colors.white, fontSize: 25),
                    ),
                  )))),
    ]),
    const Center(child: Text("Graphs")),
    Center(
        child: Column(
      children: [
        Container(
          color: AppTheme.colors.tertiarycolor,
          padding: const EdgeInsets.all(10),
          child: const Image(
            image: AssetImage("assetss/images/profile.png"),
          ),
        ),
      ],
    )),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home Page"),
      ),
      body: tabs[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        showSelectedLabels: true,
        showUnselectedLabels: true,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.pie_chart_rounded,
              size: 35,
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}
