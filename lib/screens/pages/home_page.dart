import 'package:demo2/models/expenses.dart';
import 'package:demo2/screens/log/login_screen.dart';
import 'package:demo2/screens/pages/add_expenses.dart';
import 'package:demo2/theme/theme.dart';
import 'package:demo2/token/token.dart';
import 'package:flutter/material.dart';
import "package:demo2/services/authservices.dart";
import 'package:fluttertoast/fluttertoast.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    Widget title = Container(
      child: Text(
        "Recent Expenses",
        style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
      ),
    );
    List<Expense> expenseList = [];
    Future<List<Expense>> getData() async {
      try {
        var tk = await token.storage.read(key: 'jwt');
        final res = await AuthService().getExpense(tk as String);
        for (Map i in res.data['ans']) {
          expenseList.add(
            Expense(id: i['_id'],
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
                        return Text("Loading...");
                      } else {
                        return ListView.builder(
                            itemCount: expenseList.length,
                            itemBuilder: ((context, index) {
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
                                      Text('\$${expenseList[index].amount}'),
                                      Text('${expenseList[index].category}'),
                                      Row(
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
