import 'package:dio/dio.dart';
import 'package:fluttertoast/fluttertoast.dart';

class AuthService {
  Dio diio = new Dio();
  login(name, password) async {
    try {
      var value = await diio.post(
          "https://kharcha-1.herokuapp.com/authenticate",
          data: {"name": name, "password": password},
          options: Options(contentType: Headers.formUrlEncodedContentType));
      return value;
    } on DioError catch (e) {
      Fluttertoast.showToast(
        msg: e.response?.data['msg'],
      );
    }
  }

  addUser(name, password) async {
    try {
      var value = await diio.post("https://myharcha.herokuapp.com/adduser",
          data: {"name": name, "password": password},
          options: Options(contentType: Headers.formUrlEncodedContentType));
      return value;
    } on DioError catch (e) {
      Fluttertoast.showToast(
        msg: e.response!.data['msg'],
      );
    }
  }
}
