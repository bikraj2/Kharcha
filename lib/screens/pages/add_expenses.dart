import 'package:demo2/models/expenses.dart';
import 'package:demo2/services/authservices.dart';
import 'package:demo2/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';
import '../../token/token.dart';
import 'dart:convert';
import '../../models/chart.dart';
import '../charts/pie_chart.dart';

class expenseTracker extends StatelessWidget {
  const expenseTracker({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.only(top: 50, bottom: 10),
              alignment: Alignment.topLeft,
              height: 180,
              child: Row(
                children: [
                  const Image(
                    image: AssetImage(
                      'assetss/images/logo.png',
                    ),
                  ),
                  Text(
                    ' Add Your Expenses Here  ',
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
                height: 70,
                width: 300,
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
                height: 90,
                width: 300,
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
                      setState(() {
                        date = _dateController.text;
                        money = double.parse(_moneyController.text);
                        categories = value;
                      });
                      var expense = Expense(
                          _dateController.text, categories.toString(), money);
                      var token1;
                      token.storage.read(key: "jwt").then((value) {
                        AuthService()
                            .getExpense(value)
                            .then((val) => {print(val)});
                      });
                    })),
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
