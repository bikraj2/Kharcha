import 'package:demo2/models/expenses.dart';
import 'package:demo2/screens/log/login_screen.dart';
import 'package:demo2/screens/pages/add_expenses.dart';
import 'package:demo2/theme/theme.dart';
import 'package:demo2/token/token.dart';
import 'package:flutter/material.dart';
import "package:demo2/services/authservices.dart";
import 'package:fluttertoast/fluttertoast.dart';
import 'package:demo2/models/expenseList.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class HomePage extends StatefulWidget {
  int? count;
  HomePage({Key? key, count}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int count = 10;
  List<Expense> expenseView = [];
  List<Expense> expenseList = [];
  ScrollController _scrollController = ScrollController();
  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        count = count + 5;
        if (count > expenseList.length) {
          Fluttertoast.showToast(
              msg: "End of the data.",
              textColor: Colors.white,
              backgroundColor: Colors.red);
        } else {
          Future.delayed(Duration(seconds: 1, milliseconds: 500), () {
            if (mounted) {
              setState(() {});
            }
          });
        }
      }
    });
  }

  Widget build(BuildContext context) {
    Widget title = Container(
      child: Text(
        "Recent Expenses",
        style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
      ),
    );

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
          style: TextStyle(fontStyle: FontStyle.italic, fontSize: 23),
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
                        return Center(
                            child: Column(
                          children: [
                            LoadingAnimationWidget.staggeredDotsWave(
                                color: Colors.black, size: 40),
                            const SizedBox(
                              height: 20,
                            ),
                            const Text("Please Wait"),
                          ],
                        ));
                      } else {
                        print(count);
                        expenseView += expenseList.sublist(
                            0,
                            expenseList.length < count
                                ? expenseList.length
                                : count);

                        return ListView.builder(
                            controller: _scrollController,
                            itemCount: expenseList.length < count
                                ? expenseList.length
                                : count,
                            itemBuilder: ((context, index) {
                              print("I am getting rendered");
                              return Container(
                                  height:
                                      MediaQuery.of(context).size.height * 0.20,
                                  width: MediaQuery.of(context).size.width,
                                  padding: EdgeInsets.all(10),
                                  margin: EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                      color: Color.fromARGB(255, 218, 202, 202),
                                      border: Border.all(
                                        width: 1,
                                        color: Colors.black,
                                      ),
                                      borderRadius: BorderRadius.circular(10)),
                                  child: Column(
                                    children: [
                                      Container(
                                        padding: EdgeInsets.all(10),
                                        child: Text(
                                          '${expenseList[index].name}',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 16,
                                          ),
                                        ),
                                      ),
                                      Text('\$${expenseView[index].amount}'),
                                      Text('${expenseView[index].category}'),
                                      Row(
                                        children: [
                                          Text(
                                              '${expenseView[index].date.toString().split(' ')[0]}'),
                                          IconButton(
                                            icon: Icon(Icons.delete),
                                            onPressed: () async {
                                              try {
                                                var tk = await token.storage
                                                    .read(key: 'jwt');

                                                AuthService()
                                                    .removeExpense(
                                                        tk as String,
                                                        expenseView[index].id
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
