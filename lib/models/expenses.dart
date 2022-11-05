// ignore_for_file: unnecessary_this

import '../token/token.dart';

class Expense {
  late String? name, category;
  late double? amount;
  late DateTime? date ;
  Expense({String? name, String? category, double? amount, DateTime? date1}) {
    this.name = name;
    this.category = category;
    this.amount = amount;
    this.date = date1;
  }
  Expense.fromJson(Map<String, dynamic> json)
      : amount = json['amount'],
        category = json['category'];

  Map<String, dynamic> toJson() {
    return {
      'amount': amount,
      'category': category,
    };
  }

  Object value() {
    return {
      "name": name,
      "category": category,
      "amount": amount,
      token: token.readToken()
    };
  }
}
