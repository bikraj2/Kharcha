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
import 'package:loading_animation_widget/loading_animation_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
    print(nextCount);
    super.initState();
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        prevCount = nextCount - 1;
        nextCount = ExpenseList.expenseList.length < nextCount + 10
            ? ExpenseList.expenseList.length
            : nextCount + 10;
        print(nextCount);
        Future.delayed(const Duration(seconds: 1, milliseconds: 500), () {
          if (mounted) {
            setState(() {});
          }
        });
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
    expenseView += ExpenseList.expenseList.sublist(
        prevCount,
        ExpenseList.expenseList.length < nextCount
            ? ExpenseList.expenseList.length
            : nextCount);
    Widget title = Container(
        child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text(
          "  Recent Expenses ",
          style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.w600,
              fontStyle: FontStyle.italic,
              color: AppTheme.colors.basecolor),
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
            child: expenseView.length==0?ListView.builder(
                controller: _scrollController,
                itemCount: nextCount,
                itemBuilder: ((context, index) {
                  print("asdf");
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
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                IconButton(
                                    onPressed: () {}, icon: Icon(Icons.home)),
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
                                          color:
                                              AppTheme.colors.secondarycolor),
                                      iconSize: 25,
                                      onPressed: () async {
                                        try {
                                          var tk = await token.storage
                                              .read(key: 'jwt');

                                          AuthService()
                                              .removeExpense(
                                                  tk as String,
                                                  ExpenseList.expenseList[index]
                                                      .id as String)
                                              .then((val) {
                                            if (val.data['success']) {
                                              ExpenseList.getData()
                                                  .then((value) => {
                                                        ExpenseList
                                                            .groupedTransactionValues(),
                                                      });
                                              setState(() {});
                                              Fluttertoast.showToast(
                                                  msg: "Deleted Successfully",
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
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                ExpenseList.zeros(ExpenseList
                                    .expenseList[index].amount as double),
                                style: TextStyle(
                                  color: AppTheme.colors.secondarycolor,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 22,
                                ),
                              ),
                            ]),
                        Row(
                          children: [
                            Text(" ${ExpenseList.expenseList[index].name}",
                                style: TextStyle(
                                    color: AppTheme.colors.basecolor,
                                    fontSize: 15,
                                    fontWeight: FontWeight.w400)),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                                '${expenseView[index].date.toString().split(' ')[0]}'),
                          ],
                        )
                      ],
                    ),
                  );
                })):Text("No expenses To Display"),
          )
        ]),
      ]),
    );
  }
}
