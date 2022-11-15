import 'package:flutter/material.dart';

import 'expenses.dart';
import 'package:demo2/token/token.dart';
import 'package:demo2/services/authservices.dart';
import 'package:intl/intl.dart';
import 'dart:math';
import 'package:quiver/time.dart';

List<double> weekarray = [];
List<double> montharray = [];

bool check = true;

class ExpenseList {
  static List<Expense> data = [];

  static List<Expense> monthdata = [];
  static List<Map<String, Object>> groupedData = [];
  static List<Map<String, Object>> monthgroupedData = [];
  static double weektemp = 0.0;
  static double monthtemp = 0.0;
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
      return {
        'day': DateFormat.E().format(weekday),
        'amount': totalSum,
      };
    });
  }

  static List weeklyarraylist() {
    weekarray = [];
    for (var i = 0; i < 7; i++) {
      weekarray.add(groupedData[i]['amount'] as double);
    }

    return weekarray;
  }

  static Future<List<Expense>> getMonthData(String a) async {
    monthdata = [];
    try {
      var tk1 = await token.storage.read(key: "jwt");
      final value = await AuthService().getMonthlyExpense(tk1 as String, a);
      var monthData = value.data['ans'];
      for (Map i in monthData) {
        monthdata.add(Expense(
            amount: double.parse(i['amount'].toString()),
            name: i['name'],
            date1: DateTime.parse(i['date']).toLocal(),
            category: i['category'],
            id: i['id']));
        
      }

      return monthdata;
    } catch (e) {
      throw (e);
    }
  }

  static groupMonthlyValues(int year, int month, int day) {
    monthgroupedData = [];
    monthgroupedData = List.generate(day, (index) {
      final weekday = DateTime.utc(year, month, day).subtract(
        Duration(days: index),
      );
      var totalSuminMonth = 0.0;

      for (var i = 0; i < monthdata.length; i++) {
        if (monthdata[i].date?.day == weekday.day &&
            monthdata[i].date?.month == weekday.month &&
            monthdata[i].date?.year == weekday.year) {
          totalSuminMonth += monthdata[i].amount as double;
        }
      }

      return {
        'day': weekday.day,
        'month': weekday.month,
        'amount': totalSuminMonth
      };
    });
  }

  static List monthlyArrayList() {
    monthgroupedData.map((val) {
      print(val['amount']);
    });
    montharray = [];
    for (var i = 0; i < 30; i++) {
      montharray.add(monthgroupedData[i]['amount'] as double);
    }
    return montharray;
  }

  // static double findMaxmonth() {
  // //   var lineData = ExpenseList.groupedData;

  // //   var max = lineData.reduce((currentUser, nextUser) =>
  // //       (currentUser['amount'] as double) > (nextUser['amount'] as double)
  // //           ? currentUser
  // //           : nextUser);
  // //   double maxA = max["amount"] as double;

  // //   weektemp = maxA * 1.5;
  // //   weektemp = double.parse(weektemp.toStringAsFixed(2));

  // //   return weektemp;
  // //
  // }

  static double findMaxweek() {
    var lineData = ExpenseList.groupedData;

    var max = lineData.reduce((currentUser, nextUser) =>
        (currentUser['amount'] as double) > (nextUser['amount'] as double)
            ? currentUser
            : nextUser);
    double maxA = max["amount"] as double;

    weektemp = maxA * 1.5;
    weektemp = double.parse(weektemp.toStringAsFixed(2));

    return weektemp;
  }

  //dont use truncating operator its is not good it rounds up decimal numbers to  0
  //dont use string as precision , use string as fixed..
  static String zeros(double a) {
    if (a >= 1000 && a <= 10000) {
      return ('${(a / 1000).toStringAsFixed(2)}K');
    } else if (a <= 10000 && a >= 1000) {
      return '${(a / 10000).toStringAsFixed(2)}K';
    } else if (a <= 100000 && a >= 10000) {
      return '${(a / 1000).toStringAsFixed(2)}K';
    } else if (a <= 1000000 && a >= 100000) {
      return '${(a / 1000000).toStringAsFixed(2)}M';
    } else if (a <= 10000000 && a >= 1000000) {
      return '${(a / 1000000).toStringAsFixed(2)}M';
    } else if (a <= 100000000 && a >= 10000000) {
      return '${(a / 1000000).toStringAsFixed(2)}M';
    } else if (a <= 10000000000 && a >= 1000000000) {
      return '${(a / 1000000000).toStringAsFixed(2)}B';
    } else {
      return ' ';
    }
  }

  static int monthNumber(String month) {
    if (month == "January") {
      return 1;
    } else if (month == "February") {
      return 2;
    } else if (month == "March") {
      return 3;
    } else if (month == "April") {
      return 4;
    } else if (month == "May") {
      return 5;
    } else if (month == "June") {
      return 6;
    } else if (month == "July") {
      return 7;
    } else if (month == "August") {
      return 8;
    } else if (month == "September") {
      return 9;
    } else if (month == "October") {
      return 10;
    } else if (month == "November") {
      return 11;
    } else if (month == "December") {
      return 12;
    } else {
      return 1;
    }
  }
}
