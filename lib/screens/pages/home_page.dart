import 'dart:ui';

import 'package:demo2/models/expenses.dart';
import 'package:demo2/screens/log/login_screen.dart';
import 'package:demo2/screens/pages/add_expenses.dart';
import 'package:demo2/screens/pages/filterPage.dart';
import 'package:demo2/screens/pages/filterbyExpenses.dart';
import 'package:demo2/screens/pages/fiterbyDate.dart';
import 'package:demo2/theme/theme.dart';
import 'package:demo2/token/token.dart';
import 'package:flutter/material.dart';
import "package:demo2/services/authservices.dart";
import 'package:fluttertoast/fluttertoast.dart';
import 'package:demo2/models/expenseList.dart';
import 'package:intl/intl.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:demo2/theme/constants.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String state = "";

  int nextCount =
      ExpenseList.expenseList.length < 10 ? ExpenseList.expenseList.length : 10;

  int prevCount = 0;
  List<Expense> expenseView = ExpenseList.expenseList.sublist(
      0,
      ExpenseList.expenseList.length < 10
          ? ExpenseList.expenseList.length
          : 10);

  final ScrollController _scrollController = ScrollController();
  @override
  void initState() {
    print('Wxpense is ${ExpenseList.expenseList.length}');
    super.initState();
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        prevCount = nextCount;
        nextCount = ExpenseList.expenseList.length < nextCount + 10
            ? ExpenseList.expenseList.length
            : nextCount + 10;
        expenseView += ExpenseList.expenseList.sublist(prevCount, nextCount);
        if (mounted) {
          setState(() {});
        }
      }
    });
  }

  AppBar appBar = AppBar(
    elevation: 0,
    backgroundColor: const Color.fromARGB(255, 35, 45, 64),
    title: Text(
      'Hi Username!',
      style: TextStyle(fontStyle: FontStyle.normal, fontSize: 20),
    ),
    leading: IconButton(
      icon: const Icon(Icons.person),
      onPressed: () {},
    ),
  );

  Widget build(BuildContext context) {
    Widget title = Container(
        child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Container(
          padding: EdgeInsets.only(bottom: 10),
          
          child: Text(
            "  Recent Expenses ",
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w600,
                color: AppTheme.colors.basecolor,
                
                ),
          ),
        ),
        IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (BuildContext context) => FilterPage()),
              );
            },
            icon: Icon(Icons.search_outlined))
      ],
    ));
    return Scaffold(
      appBar: appBar,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        backgroundColor: AppTheme.colors.basecolor,
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => expenseAdder()),
          );
        },
      ),
      body: Column(children: [
        title,
        Column(children: [
          Container(
            height: MediaQuery.of(context).size.height -
                appBar.preferredSize.height -
                158,
            child: expenseView.isNotEmpty
                ? ListView.builder(
                    key: Key(state),
                    controller: _scrollController,
                    itemCount: nextCount,
                    itemBuilder: ((context, index) {
                      return Container(
                        
                        height: MediaQuery.of(context).size.height / 5,
                        width: MediaQuery.of(context).size.width,
                        padding: EdgeInsets.only(left: 10, right: 10),
                        margin: EdgeInsets.only(top: 20, left: 10, right: 10),
                        decoration: BoxDecoration(
                          
                            color: Colors.white,
                            border: Border.all(
                              width: 1,
                              color: AppTheme.colors.secondarycolor,
                            ),
                            borderRadius: BorderRadius.circular(30)),
                        child: Column(
                          children: [
                            Container(
                                padding: EdgeInsets.all(10),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    IconButton(
                                        onPressed: () {},
                                        icon:Icon(icons[ExpenseList
                                          .expenseList[index].category]),
                                          iconSize: 30,
                                          ),
                                          
                                    Row(
                                      children: [
                                        IconButton(
                                          onPressed: () {},
                                          icon: Icon(
                                            Icons.edit_note_rounded,
                                            color: AppTheme.colors.basecolor,
                                          ),
                                          iconSize: 25,
                                        ),
                                        IconButton(
                                          icon: Icon(Icons.delete,
                                              color: AppTheme
                                                  .colors.secondarycolor),
                                          iconSize: 25,
                                          onPressed: () async {
                                            try {
                                              var tk = await token.storage
                                                  .read(key: 'jwt');

                                              AuthService()
                                                  .removeExpense(
                                                      tk as String,
                                                      ExpenseList
                                                          .expenseList[index]
                                                          .id as String)
                                                  .then((val) {
                                                if (val.data['success']) {
                                                  setState(() {
                                                    nextCount = ExpenseList
                                                                .expenseList
                                                                .length <
                                                            10
                                                        ? ExpenseList
                                                            .expenseList.length
                                                        : 10;

                                                    prevCount = 0;
                                                    Expense expenseTobeRemoved =
                                                        expenseView[index];

                                                    expenseView.remove(
                                                        expenseTobeRemoved);
                                                    ExpenseList.expenseList
                                                        .remove(
                                                            expenseTobeRemoved);
                                                    state += state;
                                                    print(expenseView);
                                                  });
                                                  Fluttertoast.showToast(
                                                      msg:
                                                          "Deleted Successfully",
                                                      backgroundColor:
                                                          Color.fromARGB(
                                                              255, 158, 11, 0));
                                                }
                                              });
                                            } catch (e) {
                                              Fluttertoast.showToast(
                                                  msg: e.toString());
                                            }
                                          },
                                        )
                                      ],
                                    ),
                                  ],
                                )),
                            Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "\$ ${ExpenseList.zeros(
                                        expenseView[index].amount as double)}",
                                    style: TextStyle(
                                      color: Colors.green,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 20,
                                    ),
                                  ),
                                ]),
                            Row(
                              children: [
                                Text(" ${expenseView[index].name}".toUpperCase(),
                                    style: TextStyle(
                                        color: AppTheme.colors.basecolor,
                                        fontSize: 15,
                                        fontWeight: FontWeight.w400,
                                    ),
                                        
                                        ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text(
                                    '${DateFormat("EEE d MMM").format(expenseView[index].date as DateTime).toString()}'),
                              ],
                            )
                          ],
                        ),
                      );
                    }))
                : Text("No expenses To Display"),
          )
        ]),
      ]),
    );
  }
}
