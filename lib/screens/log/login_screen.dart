import 'package:demo2/models/finance.dart';
import 'package:demo2/screens/initial_screens/first_screen.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../../services/authservices.dart';

import '../pages/add_expenses.dart';
import 'package:demo2/models/expenseList.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import '../pages/home_screen.dart';
import 'package:demo2/token/token.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  void dipose() {
    usernameController.dispose();
    passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // title: Text('Login'),
        elevation: 0,
        backgroundColor: const Color.fromARGB(255, 35, 45, 64),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => GetStartedScreen()));
          },
        ),
      ),
      body: Container(
        padding: const EdgeInsets.all(15),
        color: Colors.white,
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Image.asset(
              'assetss/images/logo.png',
              height: 130,
            ),
            const SizedBox(
              height: 20,
            ),
            TextField(
              controller: usernameController,
              style: const TextStyle(fontSize: 18, color: Colors.black54),
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                hintText: 'Username',
                contentPadding: const EdgeInsets.all(15),
                focusedBorder: OutlineInputBorder(
                  borderSide:
                      const BorderSide(color: Color.fromARGB(255, 35, 45, 64)),
                  borderRadius: BorderRadius.circular(5),
                ),
                enabledBorder: UnderlineInputBorder(
                  borderSide:
                      const BorderSide(color: Color.fromARGB(255, 35, 45, 64)),
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            TextField(
              controller: passwordController,
              obscureText: true,
              style: const TextStyle(fontSize: 18, color: Colors.black54),
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                hintText: 'Password',
                contentPadding: const EdgeInsets.all(15),
                focusedBorder: OutlineInputBorder(
                  borderSide:
                      const BorderSide(color: Color.fromARGB(255, 35, 45, 64)),
                  borderRadius: BorderRadius.circular(5),
                ),
                enabledBorder: UnderlineInputBorder(
                  borderSide:
                      const BorderSide(color: Color.fromARGB(255, 35, 45, 64)),
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () {
                String username = usernameController.text;
                String password = passwordController.text;
                if ((username == "")) {
                  Fluttertoast.showToast(
                      msg: "Please enter your username",
                      textColor: Colors.white,
                      backgroundColor: Colors.red.shade300);
                } else if ((password == "")) {
                  Fluttertoast.showToast(
                      msg: "Please enter your password",
                      textColor: Colors.white,
                      backgroundColor: Colors.red.shade300);
                } else {
                  AuthService().login(username, password).then((val) {
                    if (val.data["success"]) {
                      token.storeToken(val.data["token"]);
                      token.readToken();
                      ExpenseList.getData().then((value) {
                        ExpenseList.groupedTransactionValues();
                      });
                      Finance.getFinance();
                      ExpenseList.findMaxweek();
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (BuildContext context) {
                            return HomeScreen();
                          },
                        ),
                      );
                    } else {
                      Fluttertoast.showToast(
                          msg: val.data["msg"],
                          textColor: Colors.white,
                          backgroundColor: Colors.red.shade300);
                    }
                  });
                }
              },
              style: ButtonStyle(
                padding: MaterialStateProperty.all(
                  const EdgeInsets.all(10),
                ),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18))),
                backgroundColor: MaterialStateProperty.all(
                    const Color.fromARGB(255, 220, 63, 107)),
              ),
              child: const Text(
                'login',
                style: TextStyle(fontSize: 20),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
