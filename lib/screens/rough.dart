// import 'package:flutter/material.dart';

// import '../theme/theme.dart';

// class HomeScreen extends StatefulWidget {
//   HomeScreen({Key? key}) : super(key: key);
//   @override
//   State<HomeScreen> createState() => _HomeScreenState();
// }

// class _HomeScreenState extends State<HomeScreen> {
//   int _currentIndex = 0;
//   final tabs = [
//     Padding(
//       padding: const EdgeInsets.all(8.0),
//       child: Container(
//         height: 200,
//         color: AppTheme.colors.boxcolor,
//         child: Center(
//             child: Column(
//           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//           children: [
//             Text('B A L A N C E',
//                 style: TextStyle(color: Colors.grey[500], fontSize: 16)),
//             Text(
//               '\$' + '2000',
//               style: TextStyle(color: Colors.grey[800], fontSize: 40),
//             ),
//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 20.0),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Row(
//                     children: [
//                       Container(
//                         padding: EdgeInsets.all(10),
//                         decoration: BoxDecoration(
//                           shape: BoxShape.circle,
//                           color: Colors.grey[200],
//                         ),
//                         child: Center(
//                           child: Icon(
//                             Icons.arrow_upward,
//                             color: Colors.green,
//                           ),
//                         ),
//                       ),
//                       SizedBox(
//                         width: 10,
//                       ),
//                       Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Text('Income',
//                               style: TextStyle(color: Colors.grey[500])),
//                           SizedBox(
//                             height: 5,
//                           ),
//                           Text('\$' + '1500',
//                               style: TextStyle(
//                                   color: Colors.grey[600],
//                                   fontWeight: FontWeight.bold)),
//                         ],
//                       )
//                     ],
//                   ),
//                   Row(
//                     children: [
//                       Container(
//                         padding: EdgeInsets.all(10),
//                         decoration: BoxDecoration(
//                           shape: BoxShape.circle,
//                           color: Colors.grey[200],
//                         ),
//                         child: Center(
//                           child: Icon(
//                             Icons.arrow_downward,
//                             color: Colors.red,
//                           ),
//                         ),
//                       ),
//                       SizedBox(
//                         width: 10,
//                       ),
//                       Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Text('Expense',
//                               style: TextStyle(color: Colors.grey[500])),
//                           SizedBox(
//                             height: 5,
//                           ),
//                           Text('\$' + '10000',
//                               style: TextStyle(
//                                   color: Colors.grey[600],
//                                   fontWeight: FontWeight.bold)),
//                         ],
//                       )
//                     ],
//                   )
//                 ],
//               ),
//             ),
//             GestureDetector(
//                 child: Container(
//                     padding: EdgeInsets.all(10),
//                     alignment: Alignment.center,
//                     height: 60,
//                     width: 60,
//                     decoration: BoxDecoration(
//                       color: Colors.grey[500],
//                       shape: BoxShape.circle,
//                     ),
//                     child: Center(
//                       child: Text(
//                         '+',
//                         style: TextStyle(color: Colors.white, fontSize: 25),
//                       ),
//                     )))
//           ],
//         )),
//       ),
//     )
//     // Center(
//     //   child: Column(
//     //     children: [
//     //       Container(
//     //           height: 200,
//     //           width: 200,
//     //           padding: const EdgeInsets.all(10),
//     //           child: Container(
//     //             color: AppTheme.colors.boxcolor,
//     //             child: Row(
//     //               children: [
//     //                 ElevatedButton(
//     //                   onPressed: () {},
//     //                   child: Text("Income"),
//     //                 ),
//     //                 ElevatedButton(onPressed: () {}, child: Text("Category"))
//     //               ],
//     //             ),
//     //           ))
//     //     ],
//     //   ),
//     // ),
//     ,
//     const Center(child: Text("Graphs")),
//     Center(
//         child: Column(
//       children: [
//         Container(
//           color: AppTheme.colors.tertiarycolor,
//           padding: const EdgeInsets.all(10),
//           child: const Image(
//             image: AssetImage("assetss/images/profile.png"),
//           ),
//         ),
//       ],
//     )),
//   ];
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("Home Page"),
//       ),
//       body: tabs[_currentIndex],
//       bottomNavigationBar: BottomNavigationBar(
//         currentIndex: _currentIndex,
//         showSelectedLabels: true,
//         showUnselectedLabels: true,
//         items: const [
//           BottomNavigationBarItem(
//             icon: Icon(Icons.home),
//             label: 'Home',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(
//               Icons.pie_chart_rounded,
//               size: 35,
//             ),
//             label: '',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.person),
//             label: 'Profile',
//           ),
//         ],
//         onTap: (index) {
//           setState(() {
//             _currentIndex = index;
//           });
//         },
//       ),
//     );
//   }
// }
// // Expanded(
// //                 child: Container(
// //               height: 40,
// //               child: Text('Transactions'),
// //             )),
// //             Container(
// //               height: 25,
// //               child: GestureDetector(
// //                 child: Container(
// //                   padding: EdgeInsets.all(10),
// //                   alignment: Alignment.center,
// //                   height: 60,
// //                   width: 60,
// //                   decoration: BoxDecoration(
// //                     color: Colors.grey[500],
// //                     shape: BoxShape.circle,
// //                   ),
// //                   child: Center(
// //                     child: Text(
// //                       '+',
// //                       style: TextStyle(color: Colors.white, fontSize: 25),
// //                     ),
// //                   ),
// //                 ),
// //               ),
// //             ),