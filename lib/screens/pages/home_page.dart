import 'package:demo2/models/expenses.dart';
import 'package:demo2/screens/log/login_screen.dart';
import 'package:demo2/screens/pages/add_expenses.dart';
import 'package:demo2/theme/theme.dart';
import 'package:demo2/token/token.dart';
import 'package:flutter/material.dart';
import "package:demo2/services/authservices.dart";
import 'package:fluttertoast/fluttertoast.dart';
import 'package:demo2/models/expenseList.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
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
        IconButton(onPressed: () {}, icon: Icon(Icons.search_outlined))
      ],
    ));
    List<Expense> expenseList = [];
    Future<List<Expense>> getData() async {
      try {
        var tk = await token.storage.read(key: 'jwt');
        final res = await AuthService().getExpense(tk as String);
        for (Map i in res.data['ans']) {
          expenseList.add(
            Expense(
                id: i['_id'],
                amount: double.parse(i['amount'].toString()),
                name: i['name'],
                date1: DateTime.parse(i['date']).toLocal(),
                category: i['category']),
          );
        }
        return expenseList;
      } catch (e) {
        throw e;
      }
    }

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: const Color.fromARGB(255, 35, 45, 64),
        title: Text(
          'Hi Username!',
          style: TextStyle(fontStyle: FontStyle.normal, fontSize: 20),
        ),
        leading: IconButton(
          icon: const Icon(Icons.person),
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => LoginScreen()));
          },
        ),
      ),
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
      body: Column(
        children: [
          title,
          Expanded(
            child: Column(children: [
              Expanded(
                child: FutureBuilder(
                    future: getData(),
                    builder: ((context, snapshot) {
                      if (!snapshot.hasData) {
                        return Text("Loading...");
                      } else {
                        return ListView.builder(
                            itemCount: expenseList.length,
                            itemBuilder: ((context, index) {
                              List<Expense> newList = expenseList;
                              String getK(double amount) {
                                if (amount > 10000) {
                                  //code ot dchange value
                                  amount = amount / 1000.0;
                                }
                                String val = '\$${amount}' + "k";

                                return val;
                              }

                              return Container(
                                  height:
                                      MediaQuery.of(context).size.height / 5,
                                  width: MediaQuery.of(context).size.width,
                                  padding: EdgeInsets.only(left: 10, right: 10),
                                  margin: EdgeInsets.only(
                                      top: 20, left: 10, right: 10),
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
                                            crossAxisAlignment:
                                                CrossAxisAlignment.end,
                                            children: [
                                              IconButton(
                                                  onPressed: () {},
                                                  icon: Icon(Icons.home)),
                                              Row(
                                                children: [
                                                  IconButton(
                                                    onPressed: () {},
                                                    icon: Icon(
                                                      Icons.edit_note_rounded,
                                                      color: AppTheme
                                                          .colors.basecolor,
                                                    ),
                                                    iconSize: 25,
                                                  ),
                                                  IconButton(
                                                    icon: Icon(Icons.delete,
                                                        color: AppTheme.colors
                                                            .secondarycolor),
                                                    iconSize: 25,
                                                    onPressed: () async {
                                                      try {
                                                        var tk = await token
                                                            .storage
                                                            .read(key: 'jwt');

                                                        AuthService()
                                                            .removeExpense(
                                                                tk as String,
                                                                expenseList[index]
                                                                        .id
                                                                    as String)
                                                            .then((val) {
                                                          if (val.data[
                                                              'success']) {
                                                            setState(() {});
                                                            Fluttertoast.showToast(
                                                                msg:
                                                                    "Deleted Successfully",
                                                                backgroundColor:
                                                                    Color
                                                                        .fromARGB(
                                                                            255,
                                                                            158,
                                                                            11,
                                                                            0));
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
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              getK(expenseList[index].amount
                                                  as double),
                                              style: TextStyle(
                                                color: AppTheme
                                                    .colors.secondarycolor,
                                                fontWeight: FontWeight.w600,
                                                fontSize: 22,
                                              ),
                                            ),
                                          ]),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        children: [
                                          Text(
                                              '${expenseList[index].date.toString().split(' ')[0]}'),
                                          IconButton(
                                            icon: Icon(Icons.delete),
                                            onPressed: () async {
                                              try {
                                                var tk = await token.storage
                                                    .read(key: 'jwt');

                                                AuthService()
                                                    .removeExpense(
                                                        tk as String,
                                                        expenseList[index].id
                                                            as String)
                                                    .then((val) {
                                                  if (val.data['success']) {
                                                    setState(() {
                                                      ExpenseList.getData()
                                                          .then((value) {
                                                        ExpenseList
                                                            .groupedTransactionValues();
                                                      });
                                                    });
                                                    Fluttertoast.showToast(
                                                        msg:
                                                            "Deleted Successfully",
                                                        backgroundColor:
                                                            Colors.red);
                                                  }
                                                });
                                              } catch (e) {
                                                Fluttertoast.showToast(
                                                    msg: e.toString());
                                              }
                                            },
                                          )
                                        ],
                                      )
                                    ],
                                  ));
                            }));
                      }
                    })),
              ),
            ]),
          ),
        ],
      ),
    );
  }
}
