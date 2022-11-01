import 'dart:async';

import 'package:dio/dio.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../models/user_info.dart';
import '../models/expenses.dart';
import '../token/token.dart';

class AuthService {
  Dio diio = new Dio();
  login(username, password) async {
    try {
      print(username);
      print(password);
      var value = await diio.post("http://kharcha-1.herokuapp.com/authenticate",
          data: {"username": username, "password": password},
          options: Options(contentType: Headers.formUrlEncodedContentType));
      return value;
    } on DioError catch (e) {
      Fluttertoast.showToast(
        msg: e.response?.data['msg'],
      );
    }
  }

  addUser(Users user) async {
    try {
      var value = await diio.post("https://kharcha-1.herokuapp.com/adduser",
          data: user.value(),
          options: Options(contentType: Headers.formUrlEncodedContentType));
      print(value);
      return value;
    } on DioError catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
      return error.response;
    }
  }

  addexpense(Expense expense, token) async {
    try {
      var value = await diio.post("https://kharcha-1.herokuapp.com/addExpense",
          data: {
            "name": expense.name,
            "category": expense.category,
            "amount": expense.amount,
            "token": token
          },
          options: Options(contentType: Headers.formUrlEncodedContentType));
      return value;
    } on DioError catch (error, stacktrace) {
      print('Some error occured ${error.response?.data['msg']}');
    }
  }

  getExpense(token) async {
    try {
      var value = await diio.get("https://kharcha-1.herokuapp.com/getExpense",
          queryParameters: {"token": token},
          options: Options(contentType: Headers.formUrlEncodedContentType));
      return value;
    } on DioError catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
    }
  }
}
