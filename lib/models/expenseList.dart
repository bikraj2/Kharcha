import 'expenses.dart';
import 'package:demo2/token/token.dart';
import 'package:demo2/services/authservices.dart';
import 'package:intl/intl.dart';

class expenseList {
  static List<Expense> data = [];
  static List<Map<String,Object>>groupedData =[];
  static Future<List<Expense>> getData() async {
    try {
      var tk = await token.storage.read(key: 'jwt');
      final res = await AuthService().getExpense(tk);
      for (Map i in res.data['ans']) {
        data.add(Expense(
            amount: double.parse(i['amount'].toString()),
            name: i['name'],
            date1: DateTime.parse(i['date']).toLocal(),
            category: i['category']));
      }
      return data;
    } catch (e) {
      throw e;
    }
  }

  static  groupedTransactionValues() {
    print("This is groupTransactionValues");
    groupedData =List.generate(7, (index) {
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
}
