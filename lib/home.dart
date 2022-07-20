
import 'package:flutter/material.dart';
import 'main.dart' ; 
import 'package:flutter/cupertino.dart';


class HomeScreen extends StatefulWidget {
 HomeScreen({Key? key}) : super(key: key);

  @override
  State <HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State <HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home Page"), 
      ),
      bottomNavigationBar: BottomNavigationBar(
        showSelectedLabels: true, 
        showUnselectedLabels: true,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home), 
            activeIcon: Icon(Icons.check),
            label: 'Home', 
          
             
          ), 
          BottomNavigationBarItem(
            icon: Icon(Icons.map), 
            label: 'Chart', 
          ), 
          BottomNavigationBarItem(
            icon: Icon(Icons.person), 
            label: 'Profile', 
          ), 
          


        ],
      ),
    ); 
  }
}