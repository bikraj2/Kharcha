import 'dart:async';

import 'dart:math';

import 'package:dio/dio.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/material.dart';
import '../models/user_info.dart';
import '../models/expenses.dart';
import '../token/token.dart';

const url = "http://192.168.1.75:3000";

class AuthService {
  Dio diio = Dio();
  login(username, password) async {
    try {
      var value = await diio.post("${url}/authenticate",
          data: {"username": username, "password": password},
          options: Options(contentType: Headers.formUrlEncodedContentType));
      print(username);
      return value;
    } on DioError catch (e) {
      print(e);
      Fluttertoast.showToast(
          msg: e.response?.data['msg'],
          textColor: Colors.white,
          backgroundColor: Colors.red.shade300);
    }
  }

  addUser(Users user) async {
    try {
      var value = await diio.post("${url}/adduser",
          data: user.value(),
          options: Options(contentType: Headers.formUrlEncodedContentType));
      ;
      return value;
    } on DioError catch (e) {
      Fluttertoast.showToast(
          msg: e.response?.data['msg'],
          textColor: Colors.white,
          backgroundColor: Colors.red.shade300);
    }
  }

  changePassword(String token, String oldPassword, String newPassword) async {
    try {
      print(token);
      var value = await diio.post('${url}/changePassword',
          data: {"oldPassword":oldPassword, "newPassword":newPassword},
          queryParameters: {'token':token}
          );
           Fluttertoast.showToast(
          msg: value.data['msg'].toString(),
          textColor: Colors.white,
          backgroundColor: Colors.red.shade300);
      return value;
    } on DioError catch (e) {
      Fluttertoast.showToast(
          msg: e.response?.data['msg'],
          textColor: Colors.white,
          backgroundColor: Colors.red.shade300);
    }
  }

  addexpense(Expense expense, String? token) async {
    try {
      var value = await diio.post("${url}/addExpense",
          data: {
            "name": expense.name,
            "category": expense.category,
            "amount": expense.amount,
            "token": token,
            "date": expense.date
          },
          options: Options(contentType: Headers.formUrlEncodedContentType));
      return value;
    } on DioError catch (error, stacktrace) {
      print(error);
      print('Some error occured ${error.response?.data['msg']}');
    }
  }

  getExpense(String token) async {
    try {
      var value = await diio.get("${url}/getExpense",
          queryParameters: {"token": token},
          options: Options(contentType: Headers.formUrlEncodedContentType));
      return value;
    } on DioError catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
    }
  }

  removeExpense(String token, String id) async {
    try {
      print('${url}/${id}');
      var value = await diio.delete('${url}/${id}',
          queryParameters: {"token": token},
          options: Options(contentType: Headers.formUrlEncodedContentType));
      return value;
    } on DioError catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
    }
  }

  addIncome(String token, double amount) async {
    try {
      var value = await diio.post('${url}/income',
          data: {"amount": amount},
          queryParameters: {"token": token},
          options: Options(contentType: Headers.formUrlEncodedContentType));
      return value;
    } on DioError catch (e) {
      Fluttertoast.showToast(
          msg: e.response?.data['msg'],
          textColor: Colors.white,
          backgroundColor: Colors.red.shade300);
    }
  }

  getAmount(String token) async {
    try {
      var value = await diio.get('${url}/income',
          queryParameters: {"token": token},
          options: Options(contentType: Headers.formUrlEncodedContentType));
      return value;
    } on DioError catch (e) {
      Fluttertoast.showToast(
          msg: e.response?.data['msg'],
          textColor: Colors.white,
          backgroundColor: Colors.red.shade300);
    }
  }

  getMonthlyExpense(String token, String month) async {
    try {
      var value = await diio.get("${url}/getExpense",
          queryParameters: {"token": token, "month": month},
          options: Options(contentType: Headers.formUrlEncodedContentType));
      print(value);
    } on DioError catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
    }
  }

  getYearlyExpense(String token, String month) async {
    try {
      var value = await diio.get("${url}/getExpense",
          queryParameters: {"token": token, "year": month},
          options: Options(contentType: Headers.formUrlEncodedContentType));
      print(value);
      return value;
    } on DioError catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
    }
  }

  getExpenseStartTofinish(String token, DateTime start, DateTime finish) async {
    try {
      var value = await diio.get("${url}/getExpense",
          queryParameters: {"token": token, "start": start, "finish": finish},
          options: Options(contentType: Headers.formUrlEncodedContentType));
      return value;
    } on DioError catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
    }
  }
}
