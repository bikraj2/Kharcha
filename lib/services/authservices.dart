import 'dart:async';

import 'package:dio/dio.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../models/user_info.dart';

class AuthService {
  Dio diio = new Dio();
  login(name, password) async {
    try {
      var value = await diio.post("http://192.168.1.68:3000/authenticate",
          data: {"username": name, "password": password},
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
      print("I am here");
      var value = await diio.post("http://192.168.1.68:3000/adduser",
          data: user.value(),
          options: Options(contentType: Headers.formUrlEncodedContentType));
      return value;
    } on DioError catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
      return error.response;
    }
  }
}
