import 'package:demo2/token/token.dart';
import 'package:demo2/services/authservices.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Finance {
  static double income = 0;
  static double expense = 0;

  static Future getFinance() async {
    try {
      var tk = await token.storage.read(key: 'jwt');
      var finance = await AuthService().getAmount(tk as String);
      expense = double.parse(finance.data['value']['expense'].toString());
      income = double.parse(finance.data['value']['budget'].toString());
      return finance;
    } catch (e) {
      Fluttertoast.showToast(msg: e.toString());
    }
  }
}
