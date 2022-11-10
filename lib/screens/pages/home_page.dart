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
                                        children: [
                                          Text(" ${expenseList[index].name}",
                                              style: TextStyle(
                                                  color:
                                                      AppTheme.colors.basecolor,
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.w400)),
                                        ],
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        children: [
                                          Text(
                                              '${expenseView[index].date.toString().split(' ')[0]}'),
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
