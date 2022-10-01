import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';
import 'package:demo2/services/authservices.dart' as auth;

import '../../token/token.dart';

late int userEntries;

int healthAmount = 0;
int foodAmount = 0;
int luxuryAmount = 0;
int rentAmount = 0;

int whealtAmount = 0;
int wfoodAmount = 0;
int wluxuryAmount = 0;
int wrentAmount = 0;

class testClass1 {
  void weekdaySelection(var weekday) {
    switch (weekday) {
      case "Sunday":
        whealtAmount = healthAmount;
        wfoodAmount = foodAmount;
        wluxuryAmount = luxuryAmount;
        wrentAmount = rentAmount;
        break;

      case "Monday":
        whealtAmount = healthAmount;
        wfoodAmount = foodAmount;
        wluxuryAmount = luxuryAmount;
        wrentAmount = rentAmount;

        break;

      case "Tuesday":
        whealtAmount = healthAmount;
        wfoodAmount = foodAmount;
        wluxuryAmount = luxuryAmount;
        wrentAmount = rentAmount;
        break;

      case "Wednesday":
        whealtAmount = healthAmount;
        wfoodAmount = foodAmount;
        wluxuryAmount = luxuryAmount;
        wrentAmount = rentAmount;
        break;

      case "Thursday":
        whealtAmount = healthAmount;
        wfoodAmount = foodAmount;
        wluxuryAmount = luxuryAmount;
        wrentAmount = rentAmount;
        break;
      case "Friday":
        whealtAmount = healthAmount;
        wfoodAmount = foodAmount;
        wluxuryAmount = luxuryAmount;
        wrentAmount = rentAmount;
        break;

      case "Saturday":
        whealtAmount = healthAmount;
        wfoodAmount = foodAmount;
        wluxuryAmount = luxuryAmount;
        wrentAmount = rentAmount;
        break;
    }
  }
}
