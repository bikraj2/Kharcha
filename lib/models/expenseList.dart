import 'expenses.dart';
import 'package:demo2/token/token.dart';
import 'package:demo2/services/authservices.dart';
import 'package:intl/intl.dart';

class ExpenseList {
  static List<Expense> data = [];
  static List<Map<String, Object>> groupedData = [];
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
      return {'day': DateFormat.E().format(weekday), 'amount': totalSum};
    });
    
    print(groupedData);
  }
}
