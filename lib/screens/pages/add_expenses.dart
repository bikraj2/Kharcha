import 'package:demo2/models/expenses.dart';
import 'package:demo2/services/authservices.dart';
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
        body: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: Column(
            children: [
              Container(
                  padding: EdgeInsets.all(15),
                  child: TextField(
                      controller: _moneyController,
                      decoration: InputDecoration(
                          hintText: 'Enter the amount ',
                          border: OutlineInputBorder(),
                          suffixIcon: IconButton(
                            onPressed: () {
                              _moneyController.clear();
                            },
                            icon: Icon(Icons.clear),
                          ))))
            ],
          ),
        ),
        Center(
          child: Column(
            children: [
              Container(
                  padding: EdgeInsets.all(15),
                  child: TextField(
                      controller: _dateController,
                      decoration: InputDecoration(
                          hintText: 'Is it sunday? ',
                          border: OutlineInputBorder(),
                          suffixIcon: IconButton(
                            onPressed: () {
                              _dateController.clear();
                            },
                            icon: Icon(Icons.clear),
                          ))))
            ],
          ),
        ),
        Center(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 4),
            decoration: BoxDecoration(
                border: Border.all(color: Colors.black, width: 4),
                borderRadius: BorderRadius.circular(10)),
            child: DropdownButton<String>(
              value: value,
              isExpanded: true,
              iconSize: 36,
              icon: Icon(Icons.arrow_drop_down, color: Colors.black),
              items: category.map(buildMenuItem).toList(),
              onChanged: (value) => setState(() {
                this.value = value;
              }),
            ),
          ),
        ),
        Center(
          child: Container(
              padding: EdgeInsets.all(25),
              child: FloatingActionButton(
                  child: Text("Save"),
                  onPressed: () {
                    setState(() {
                      date = _dateController.text;
                      money = double.parse(_moneyController.text);
                      categories = value;
                    });
                    var expense = Expense(
                        _dateController.text, categories.toString(), money);

                    token.storage.read(key: "jwt").then((value) {
                      AuthService()
                          .addexpense(expense, value)
                          .then((val) => {print(val)});
                    });
                  })),
        ),
        Center(
          child: Container(
              padding: EdgeInsets.all(25),
              child: FloatingActionButton(
                  child: Text("Get"),
                  onPressed: () {
                    try {
                      token.storage.read(key: "jwt").then((value) {
                        AuthService().getExpense(value).then((val) => {
                                                           
                              userEntries= val.data["ans"].length,
                              
                              print(val.data["ans"][0]["category"].runtimeType),
                              for(int i = 0 ; i<userEntries; i++){
                                
                                
                                if(val.data["ans"][i]["category"] == "Health"){
                                  healthAmount = val.data["ans"][i]["amount"] + healthAmount, 
                                },
                                if(val.data["ans"][i]["category"] == "Luxury"){
                                  luxuryAmount = val.data["ans"][i]["amount"] + luxuryAmount, 
                                },
                                if(val.data["ans"][i]["category"] == "Rent"){
                                  rentAmount = val.data["ans"][i]["amount"] + rentAmount, 
                                },
                                if(val.data["ans"][i]["category"] == "Food"){
                                  foodAmount = val.data["ans"][i]["amount"] + foodAmount, 
                                }
                              
                              },
                              print(healthAmount),
                              print(luxuryAmount),
                              print(foodAmount),
                              print(rentAmount),
                             
                              
                            });
                      });
                    } catch (e) {
                      print(e);
                    }
                  })),
        ),
        // Center(
        //   child: Container(
        //     padding: EdgeInsets.all(25), 
        //     child: FloatingActionButton(
        //       child: Text("Pie"), 
        //       onPressed: (){
        //         Navigator.push(
        //           context,
        //           MaterialPageRoute(builder: (context) => Piechart1()),
        //         );
        //       },
        //     )
        //     ),)
      ],
    ));
  }

  DropdownMenuItem<String> buildMenuItem(String item) => DropdownMenuItem(
      value: item,
      child: Text(
        item,
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
      ));
}
