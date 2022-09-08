// ignore_for_file: unnecessary_this

import '../token/token.dart';
class Expense {
  late String name, category;
  late double amount;
  Expense(String name, String category, double amount) {
    this.name = name;
    this.category = category;
    this.amount = amount;
  }
  Object value() {
    return {"name": name, "category": category, "amount": amount,token:token.readToken()};
  }
}
