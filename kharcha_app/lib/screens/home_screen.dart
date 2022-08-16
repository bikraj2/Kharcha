// import 'package:bubbled_navigation_bar/bubbled_navigation_bar.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';

// class HomeScreen extends StatefulWidget {
//   const HomeScreen({Key? key}) : super(key: key);

//   @override
//   _HomeScreenState createState() => _HomeScreenState();
// }

// class _HomeScreenState extends State<HomeScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       bottomNavigationBar: BubbledNavigationBar(
//         defaultBubbleColor: Colors.blue,
//         onTap: (index) {
//           // handle tap
//         },
//         items: <BubbledNavigationBarItem>[
//           BubbledNavigationBarItem(
//             icon: Icon(CupertinoIcons.home, size: 30, color: Colors.red),
//             activeIcon:
//                 Icon(CupertinoIcons.home, size: 30, color: Colors.white),
//             title: Text(
//               'Home',
//               style: TextStyle(color: Colors.white, fontSize: 12),
//             ),
//           ),
//           BubbledNavigationBarItem(
//             icon: Icon(CupertinoIcons.phone, size: 30, color: Colors.purple),
//             activeIcon:
//                 Icon(CupertinoIcons.phone, size: 30, color: Colors.white),
//             title: Text(
//               'Phone',
//               style: TextStyle(color: Colors.white, fontSize: 12),
//             ),
//           ),
//           BubbledNavigationBarItem(
//             icon: Icon(CupertinoIcons.info, size: 30, color: Colors.teal),
//             activeIcon:
//                 Icon(CupertinoIcons.info, size: 30, color: Colors.white),
//             title: Text(
//               'Info',
//               style: TextStyle(color: Colors.white, fontSize: 12),
//             ),
//           ),
//           BubbledNavigationBarItem(
//             icon: Icon(CupertinoIcons.profile_circled,
//                 size: 30, color: Colors.cyan),
//             activeIcon: Icon(CupertinoIcons.profile_circled,
//                 size: 30, color: Colors.white),
//             title: Text(
//               'Profile',
//               style: TextStyle(color: Colors.white, fontSize: 12),
//             ),
//           ),
//         ],
//       ),
//       body: Container(
//         color: Colors.blue,
//       ),
//     );
//   }
// }
