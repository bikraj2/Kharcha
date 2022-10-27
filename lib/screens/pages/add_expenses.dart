import 'package:demo2/models/expenses.dart';
import 'package:demo2/screens/pages/bar_chart.dart';
import 'package:demo2/services/authservices.dart';
import 'package:demo2/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';
import '../../token/token.dart';
import 'dart:convert';
import '../../models/chart.dart';
import '../charts/pie_chart.dart';
import 'bar_chart.dart';

class expenseTracker extends StatelessWidget {
  expenseTracker({Key? key}) : super(key: key);
  var orientation, size, height, width;

  @override
  Widget build(BuildContext context) {
    orientation = MediaQuery.of(context).orientation;

    //size of the window
    size = MediaQuery.of(context).size;
    height = size.height;
    width = size.width;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Add your expenses'),
      ),
      body: const expenseAdder(),
    );
  }
}

class expenseAdder extends StatefulWidget {
  const expenseAdder({Key? key}) : super(key: key);

  @override
  State<expenseAdder> createState() => _expenseAdderState();
}

class _expenseAdderState extends State<expenseAdder> {
  var orientation, size, height, width;

  final _dateController = TextEditingController();
  final _moneyController = TextEditingController();
  String date = " ";

  int? cat;
  String? value;
  List<dynamic> responsevar = [];
  String resstring = " ";

  late double money;
  String? categories = "";
  final category = ['Health', 'Rent', 'Food', 'Luxury'];
  @override
  Widget build(BuildContext context) {
    orientation = MediaQuery.of(context).orientation;

    //size of the window
    size = MediaQuery.of(context).size;
    height = size.height;
    width = size.width;
    return Scaffold(
      appBar: AppBar(title: Text("Add Your Expense Here")),
      body: Center(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.only(top: 50, bottom: 10),
              alignment: Alignment.topLeft,
              height: height / 6,
              child: Row(
                children: [
                  const Image(
                    image: AssetImage(
                      'assetss/images/logo.png',
                    ),
                  ),
                  Text(
                    ' Enter the fields below ',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 15,
                      fontStyle: FontStyle.normal,
                      color: AppTheme.colors.basecolor,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
            Container(
                margin: const EdgeInsets.only(top: 50),
                height: height / 7,
                width: width / 2,
                child: TextField(
                    controller: _moneyController,
                    decoration: InputDecoration(
                        hintText: 'Enter the amount ',
                        focusColor: AppTheme.colors.basecolor,
                        fillColor: AppTheme.colors.basecolor,
                        border: const OutlineInputBorder(),
                        suffixIcon: IconButton(
                          onPressed: () {
                            _moneyController.clear();
                          },
                          icon: const Icon(
                            Icons.clear,
                            // color: AppTheme.colors.basecolor,
                          ),
                        )))),
            SizedBox(
                height: height / 7,
                width: width / 2,
                child: TextField(
                    controller: _dateController,
                    decoration: InputDecoration(
                        fillColor: AppTheme.colors.basecolor,
                        hintText: 'Is it sunday? ',
                        border: const OutlineInputBorder(),
                        suffixIcon: IconButton(
                          onPressed: () {
                            _dateController.clear();
                          },
                          icon: const Icon(
                            Icons.clear,
                            // color: AppTheme.colors.basecolor,
                          ),
                        )))),
            Container(
              width: 350,
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 4),
              // decoration: BoxDecoration(
              //     border: Border.all(
              //         color: AppTheme.colors.secondarycolor, width: 1),
              //     borderRadius: BorderRadius.circular(10)),
              child: DropdownButton<String>(
                value: value,
                isExpanded: true,
                iconSize: 36,
                icon: Icon(Icons.arrow_drop_down,
                    color: AppTheme.colors.basecolor),
                items: category.map(buildMenuItem).toList(),
                onChanged: (value) => setState(() {
                  this.value = value;
                }),
              ),
            ),
            Container(
                padding: const EdgeInsets.all(25),
                child: FloatingActionButton(
                    hoverColor: AppTheme.colors.basecolor,
                    backgroundColor: AppTheme.colors.secondarycolor,
                    child: const Text("Save"),
                    onPressed: () {
                      showDialog(
                          context: context,
                          barrierDismissible: false,
                          builder: (context) {
                            return AlertDialog(
                              title: Text("Expense will be added"),
                              content: Text("Are you sure"),
                              actions: [
                                FlatButton(
                                  onPressed: () {
                                    setState(() {
                                      date = _dateController.text;
                                      money =
                                          double.parse(_moneyController.text);
                                      categories = value;
                                    });
                                    var expense = Expense(_dateController.text,
                                        categories.toString(), money);

                                    token.storage
                                        .read(key: "jwt")
                                        .then((value) {
                                      AuthService()
                                          .getExpense(value)
                                          .then((val) => {print(val)});
                                    });
                                    token.storage
                                        .read(key: "jwt")
                                        .then((value) {
                                      AuthService()
                                          .addexpense(expense, value)
                                          .then((val) => {print(val)});
                                    });
                                  },
                                  child: Text("YES"),
                                ),
                                FlatButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: Text("NO"),
                                )
                              ],
                            );
                          });
                    })),
            // Container(
            //     padding: const EdgeInsets.all(25),
            //     child: FloatingActionButton(
            //         hoverColor: AppTheme.colors.basecolor,
            //         backgroundColor: AppTheme.colors.secondarycolor,
            //         child: const Text("Bar"),
            //         onPressed: () {
            //           Navigator.push(
            //             context,
            //             MaterialPageRoute(builder: (context) => BarChart()),
            //           );
            //         }))
          ],
        ),
      ),
    );
  }

  DropdownMenuItem<String> buildMenuItem(String item) => DropdownMenuItem(
      value: item,
      child: Text(
        item,
        style: const TextStyle(fontSize: 14),
      ));
}
