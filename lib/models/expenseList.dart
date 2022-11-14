import 'expenses.dart';
import 'package:demo2/token/token.dart';
import 'package:demo2/services/authservices.dart';
import 'package:intl/intl.dart';
import 'dart:math';

List<double> array = [];

class ExpenseList {
  static List<Expense> data = [];
  static List<Map<String, Object>> groupedData = [];
  static double temp = 0.0;
  ExpenseList() {}
  static Future<List<Expense>> getData() async {
    data = [];
    try {
      var tk = await token.storage.read(key: 'jwt');
      final res = await AuthService().getExpense(tk as String);
      for (Map i in res.data['ans']) {
        data.add(Expense(
            amount: double.parse(i['amount'].toString()),
            name: i['name'],
            date1: DateTime.parse(i['date']).toLocal(),
            category: i['category'],
            id: i['id']));
      }
      return data;
    } catch (e) {
      throw e;
    }
  }

  static groupedTransactionValues() {
    groupedData = [];
    groupedData = List.generate(7, (index) {
      final weekday = DateTime.now().subtract(
        Duration(days: index),
      );
      var totalSum = 0.0;
      for (var i = 0; i < data.length; i++) {
        if (data[i].date?.day == weekday.day &&
            data[i].date?.month == weekday.month &&
            data[i].date?.year == weekday.year) {
          totalSum += data[i].amount as double;
        }
      }
      return {'day': DateFormat.E().format(weekday), 'amount': totalSum};
    });
  }

  static double findMax() {
    var lineData = ExpenseList.groupedData;

    var max = lineData.reduce((currentUser, nextUser) =>
        (currentUser['amount'] as double) > (nextUser['amount'] as double)
            ? currentUser
            : nextUser);
    double maxA = max["amount"] as double;

    temp = maxA * 1.5;
    temp = double.parse(temp.toStringAsFixed(2));
    print(temp);
    return temp;
  }
  //dont use truncating operator its is not good it rounds up to 0
  static String zeros(double a) {
    if (a >= 1000 && a <= 10000) {
      return ('${(a / 1000).toStringAsPrecision(1)}K');
    } else if (a <= 10000 && a >= 1000) {
      return '${(a / 10000).toStringAsPrecision(1)}K';
    } else if (a <= 100000 && a >= 10000) {
      return '${(a / 1000).toStringAsPrecision(1)}K';
    } else if (a <= 1000000 && a >= 100000) {
      
      return '${(a / 1000000).toStringAsPrecision(1)}M';
    } else if (a <= 10000000 && a >= 1000000) {
      return '${(a / 1000000).toStringAsPrecision(1)}M';
    } else if (a <= 100000000 && a >= 10000000) {
      return '${(a / 1000000).toStringAsPrecision(1)}M';
    } else if (a <= 10000000000 && a >= 1000000000) {
      return '${(a / 1000000000).toStringAsPrecision(1)}B';
    } else {
      return ' ';
    }
  }

  static List arraylist() {
    array = [];
    for (var i = 0; i < 7; i++) {
      array.add(groupedData[i]['amount'] as double);
    }
    print(array);
    return array;
  }
}
