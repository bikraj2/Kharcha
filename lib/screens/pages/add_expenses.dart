import 'dart:math';

import 'package:demo2/models/expenses.dart';
import 'package:demo2/screens/charts/pie_chart.dart';
import 'package:demo2/screens/pages/home_page.dart';
import 'package:demo2/services/authservices.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';
import '../../theme/theme.dart';
import '../../token/token.dart';
import 'package:demo2/models/expenseList.dart';

class expenseTracker extends StatelessWidget {
  expenseTracker({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text('Add your expenses'),
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

var orientation, size, height, width;

class _expenseAdderState extends State<expenseAdder> {
  final _dateController = TextEditingController();
  final _moneyController = TextEditingController();
  DateTime? currentDate = DateTime.now();
  String date = " ";
  String? value;
  late double money;
  String? categories = "";
  final category = ['Health', 'Rent', 'Food', 'Luxury'];
  void getDate() {
    showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(2018),
            lastDate: DateTime.now())
        .then((val) => {
              setState(() => {currentDate = val}),
            });
  }

  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();
    String formattedDate = DateFormat("EEE d MMM").format(now);
    orientation = MediaQuery.of(context).orientation;
    //size of the window
    size = MediaQuery.of(context).size;
    height = size.height;
    width = size.width;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppTheme.colors.basecolor,
        title: Text(
          ' Add Expenses!',
          style: TextStyle(fontStyle: FontStyle.italic, fontSize: height / 30),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => HomePage()));
          },
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                margin: EdgeInsets.only(left: 20, top: 20),
                child: Text(
                  "Today, " + formattedDate,
                  style: TextStyle(
                    color: AppTheme.colors.secondarycolor,
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
          Center(
            child: Column(
              children: [
                Container(
                    width: width,
                    height: height / 8,
                    padding: EdgeInsets.all(15),
                    margin: EdgeInsets.only(top: 10),
                    child: TextField(
                        controller: _moneyController,
                        decoration: InputDecoration(
                            labelText: 'Amount ',
                            border: OutlineInputBorder(),
                            suffixIcon: IconButton(
                              onPressed: () {
                                _moneyController.clear();
                              },
                              icon: Icon(Icons.clear),
                              iconSize: 14,
                            )))),
                Container(
                    margin: EdgeInsets.only(top: 10),
                    width: width,
                    height: height / 8,
                    padding: EdgeInsets.all(15),
                    child: TextField(
                        controller: _dateController,
                        decoration: InputDecoration(
                            labelText: 'Expense Title ',
                            border: OutlineInputBorder(),
                            suffixIcon: IconButton(
                              onPressed: () {
                                _dateController.clear();
                              },
                              icon: Icon(Icons.clear),
                              iconSize: 14,
                            )))),
                Container(
                  padding: EdgeInsets.all(15),
                  margin: EdgeInsets.all(10),
                  width: width / 1.2,
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(10)),
                  child: DropdownButton<String>(
                    value: value,
                    isExpanded: true,
                    iconSize: 30,
                    icon: Icon(Icons.arrow_drop_down,
                        color: AppTheme.colors.secondarycolor),
                    items: category.map(buildMenuItem).toList(),
                    onChanged: (value) => setState(() {
                      this.value = value;
                    }),
                  ),
                ),
                IconButton(
                  color: Theme.of(context).primaryColor,
                  hoverColor: Theme.of(context).bottomAppBarColor,
                  icon: Icon(
                    Icons.calendar_month_outlined,
                    color: AppTheme.colors.secondarycolor,
                  ),
                  iconSize: 35,
                  onPressed: () {
                    getDate();
                  },
                ),
                Container(
                    padding: EdgeInsets.all(15),
                    child: ElevatedButton(
                        style: ButtonStyle(),
                        // shape: BeveledRectangleBorder(
                        //     borderRadius: BorderRadius.all(Radius.circular(5))),
                        // hoverColor: AppTheme.colors.basecolor,
                        // backgroundColor: AppTheme.colors.secondarycolor,
                        child: const Text(
                          "Save",
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.w600),
                        ),
                        onPressed: () {
                          setState(() {
                            date = _dateController.text;
                            money = double.parse(_moneyController.text);
                            categories = value;
                          });
                          var expense = Expense(
                              name: _dateController.text,
                              category: categories.toString(),
                              amount: money,
                              date1: currentDate);

                          token.storage.read(key: "jwt").then((value) {
                            print(value);
                            AuthService()
                                .addexpense(expense, value)
                                .then((val) {
                              if (val.data['success']) {
                                ExpenseList.getData().then((value) {
                                  ExpenseList.groupedTransactionValues();
                                });
                                ExpenseList.findMax();
                                Fluttertoast.showToast(
                                    msg: val.data['msg'],
                                    textColor: Colors.white,
                                    backgroundColor: Colors.green);
                              } else {
                                Fluttertoast.showToast(
                                    msg: val.data['msg'],
                                    textColor: Colors.white,
                                    backgroundColor: Colors.green);
                              }
                            });
                          });
                        })),
              ],
            ),
          )
        ],
      ),
    );
  }

  DropdownMenuItem<String> buildMenuItem(String item) => DropdownMenuItem(
      value: item,
      child: Text(
        item,
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
      ));
}
