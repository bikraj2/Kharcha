import 'package:demo2/screens/pages/graphs_page.dart';
import 'package:demo2/screens/pages/home_page.dart';
import 'package:demo2/screens/pages/profile_page.dart';
import 'package:demo2/theme/theme.dart';
import 'package:flutter/material.dart';
import 'home_page.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentIndex = 0;
<<<<<<< HEAD
  final screens = [const GraphsPage(), const HomePage(), const ProfilePage()];
=======
  final screens = [const GraphsPage(), const HomePage(), ProfilePage()];
>>>>>>> master
  @override
  Widget build(BuildContext context) => Scaffold(
        body: screens[currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          selectedItemColor: AppTheme.colors.basecolor,
          unselectedItemColor: const Color.fromARGB(137, 92, 91, 91),
          showUnselectedLabels: false,
          iconSize: 30,
          currentIndex: currentIndex,
          onTap: (index) => setState(() => currentIndex = index),
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.bar_chart_rounded),
              label: 'Charts',
              // backgroundColor: AppTheme.colors.basecolor,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
              // backgroundColor: AppTheme.colors.basecolor,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Profile',
              // backgroundColor: AppTheme.colors.basecolor,
            ),
          ],
        ),
      );
}
