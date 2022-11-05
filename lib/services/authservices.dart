import 'dart:async';
import 'dart:math';

import 'package:dio/dio.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../models/user_info.dart';
import '../models/expenses.dart';
import '../token/token.dart';

const url = "http://192.168.1.75:3000";

class AuthService {
  Dio diio = new Dio();
  login(username, password) async {
    try {
      var value = await diio.post("${url}/authenticate",
          data: {"username": username, "password": password},
          options: Options(contentType: Headers.formUrlEncodedContentType));
      return value;
    } on DioError catch (e) {
      print(e);
      Fluttertoast.showToast(
        msg: e.response?.data['msg'],
      );
    }
  }

  addUser(Users user) async {
    try {
      var value = await diio.post("${url}/adduser",
          data: user.value(),
          options: Options(contentType: Headers.formUrlEncodedContentType));
      print(value);
      return value;
    } on DioError catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
      return error.response;
    }
  }

  addexpense(Expense expense,String? token ) async {
    try {

      var value = await diio.post("${url}/addExpense",
          data: {
            "name": expense.name,
            "category": expense.category,
            "amount": expense.amount,
            "token": token,
            "date":expense.date
          },
          options: Options(contentType: Headers.formUrlEncodedContentType));
      return value;
    } on DioError catch (error, stacktrace) {
      print(error);
      print('Some error occured ${error.response?.data['msg']}');
    }
  }

  getExpense(token) async {
    try {
      var value = await diio.get("${url}/getExpense",
          queryParameters: {"token": token},
          options: Options(contentType: Headers.formUrlEncodedContentType));
      return value;
    } on DioError catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
    }
  }
}
