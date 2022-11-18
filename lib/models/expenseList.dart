import 'package:flutter/material.dart';

import 'expenses.dart';
import 'package:demo2/token/token.dart';
import 'package:demo2/services/authservices.dart';
import 'package:intl/intl.dart';
import 'dart:math';
import 'package:quiver/time.dart';

List<double> weekarray = [];
List<double> montharray = [];
List<double> yeararray = [];

class ExpenseList {
  static List<Expense> data = [];
  static double jantemp = 0.0;
  static double febtemp = 0.0;
  static double marchtemp = 0.0;
  static double apriltemp = 0.0;
  static double maytemp = 0.0;
  static double junetemp = 0.0;
  static double julytemp = 0.0;
  static double augusttemp = 0.0;
  static double septembertemp = 0.0;
  static double octobertemp = 0.0;
  static double novembertemp = 0.0;
  static double decembertemp = 0.0;

  static List<Expense> expenseList = []; //for expense shown in home_page
  static List<Expense> monthdata = [];
  static int month = 0;
  static List<Expense> yeardata = [];
  static List<Map<String, Object>> groupedData = [];
  static List<Map<String, Object>> monthgroupedData = [];
  static List<Map<String, Object>> yeargroupedData = [];
  static double weektemp = 0.0;
  static double monthtemp = 0.0;
  static double yeartemp = 0.0;

  static Future<List<Expense>> getData() async {
    expenseList = [];
    try {
      var tk = await token.storage.read(key: 'jwt');
      final res = await AuthService().getExpense(tk as String);
      print(res);
      for (Map i in res.data['ans']) {
        print(i['amount']);
        expenseList.add(Expense(
            amount: double.parse(i['amount'].toString()),
            name: i['name'],
            date1: DateTime.parse(i['date']).toLocal(),
            category: i['category'],
            id: i['_id']));
      }
      groupedTransactionValues();
      return expenseList;
    } catch (e) {
      rethrow;
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
    weeklyarraylist();
  }

  static List weeklyarraylist() {
    weekarray = [];
    for (var i = 0; i < 7; i++) {
      weekarray.add(groupedData[i]['amount'] as double);
    }
    findMaxweek();

    return weekarray;
  }

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

      int year = int.parse(a.substring(0, 4));

      month = int.parse(a.substring(5, 7));

      ExpenseList.groupMonthlyValues(year, month, daysInMonth(year, month));

      return monthdata;
    } catch (e) {
      throw (e);
    }
  }

  static groupMonthlyValues(int year, int month, int day) {
    monthgroupedData = [];
    monthgroupedData = List.generate(day, (index) {
      final weekday = DateTime.utc(year, month, index);

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

    ExpenseList.findMaxmonth();
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

  static double findMaxmonth() {
    var lineData = ExpenseList.monthgroupedData;

    var max = lineData.reduce((currentUser, nextUser) =>
        (currentUser['amount'] as double) > (nextUser['amount'] as double)
            ? currentUser
            : nextUser);
    double maxA = max["amount"] as double;

    monthtemp = maxA * 1.5;
    monthtemp = double.parse(monthtemp.toStringAsFixed(2));

    return monthtemp;
  }

  static Future<List<Expense>> getYearData(String a) async {
    yeardata = [];
    try {
      var tk1 = await token.storage.read(key: "jwt");
      final value = await AuthService().getYearlyExpense(tk1 as String, a);
      var yearData = value.data['ans'];
      for (Map i in yearData) {
        yeardata.add(Expense(
            amount: double.parse(i['amount'].toString()),
            name: i['name'],
            date1: DateTime.parse(i['date']).toLocal(),
            category: i['category'],
            id: i['id']));
      }

      int year = int.parse(a);

      ExpenseList.groupYearlyValues(year);

      return yeardata;
    } catch (e) {
      throw (e);
    }
  }

  static void groupYearlyValues(int year) {
    yeargroupedData = [];
    DateTime weekday;

    yeargroupedData = List.generate(12, (index) {
      weekday = DateTime.utc(year, index + 1);
      double totalsumInYear = 0.0;

      for (var i = 0; i < yeardata.length; i++) {
        if (weekday.month == yeardata[i].date?.month &&
            weekday.year == yeardata[i].date?.year) {
          totalsumInYear += yeardata[i].amount as double;
        }
      }
      return {
        "month": weekday.month,
        "amount": totalsumInYear,
      };
    });
    print(yeargroupedData);
    ExpenseList.findMaxyear();

    return;
  }

  static int days_in_year(int a) {
    int totaldays = 0;
    for (int i = 0; i < 13; i++) {
      totaldays = totaldays + daysInMonth(a, i);
    }
    return totaldays;
  }

  static double findMaxyear() {
    var lineData = ExpenseList.yeargroupedData;
    var max = lineData.reduce((currentUser, nextUser) =>
        (currentUser['amount'] as double) > (nextUser['amount'] as double)
            ? currentUser
            : nextUser);
    double maxA = max["amount"] as double;

    yeartemp = maxA * 1.5;
    yeartemp = double.parse(yeartemp.toStringAsFixed(2));

    return yeartemp;
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
      return a.toStringAsFixed(1);
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

  static String monthName(int a) {
    if (a == 1) {
      return "January";
    } else if (a == 2) {
      return "February";
    } else if (a == 3) {
      return "March";
    } else if (a == 4) {
      return "April";
    } else if (a == 5) {
      return "May";
    } else if (a == 6) {
      return "June";
    } else if (a == 7) {
      return "July";
    } else if (a == 8) {
      return "August";
    } else if (a == 9) {
      return "September";
    } else if (a == 10) {
      return "October";
    } else if (a == 11) {
      return "November";
    } else if (a == 12) {
      return "December";
    } else {
      return " ";
    }
  }
}
