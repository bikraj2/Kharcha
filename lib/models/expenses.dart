// ignore_for_file: unnecessary_this

import 'dart:ffi';

class Expense {
  late String name, category, date;
  late Double amount ;
  Expense(String name, String category, String date, Double amount) {
    this.name = name;
    this.category = category;
    this.amount = amount;
    this.date = date;
  }
  Object value() {
    return {
      "name":name,
      "category":category,
      "amount":amount,
      "date":date
    };
  }
}
