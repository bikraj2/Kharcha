import 'package:demo2/models/finance.dart';
import 'package:demo2/models/username.dart';
import 'package:demo2/screens/initial_screens/first_screen.dart';
import 'package:demo2/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../../services/authservices.dart';

import '../pages/add_expenses.dart';
import 'package:demo2/models/expenseList.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import '../pages/home_screen.dart';
import 'package:demo2/token/token.dart';
import 'forgotPassword.dart';

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
        title: Text("Login"),
        backgroundColor: AppTheme.colors.basecolor,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => GetStartedScreen()));
          },
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          IconButton(
            onPressed: () {},
            icon: Image(
              image: AssetImage("assetss/images/loginn.png"),
            ),
            iconSize: 350,
          ),
          SizedBox(
            width: 250,
            height: 40,
            child: TextField(
              controller: usernameController,
              style: const TextStyle(fontSize: 18, color: Colors.black54),
              decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  labelText: 'Username',
                  contentPadding: const EdgeInsets.all(15),
                  border: OutlineInputBorder()),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          SizedBox(
            width: 250,
            height: 40,
            child: TextField(
              controller: passwordController,
              obscureText: true,
              style: const TextStyle(fontSize: 18, color: Colors.black54),
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                labelText: 'Password',
                contentPadding: const EdgeInsets.all(15),
                border: OutlineInputBorder(),
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          TextButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return ForgotPassword();
                }));
              },
              child: Text(
                "Forgot Password?",
                style: TextStyle(decoration: TextDecoration.underline),
              )),
          SizedBox(
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
                    token.storage.write(key: 'jwt', value: val.data['token']);
                    UserName.username = val.data['username'];
                    print(UserName.username);
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
                const EdgeInsets.all(5),
              ),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5))),
              backgroundColor:
                  MaterialStateProperty.all(AppTheme.colors.basecolor),
            ),
            child: const Text(
              'Login',
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.w400),
            ),
          ),
        ],
      ),
    );
  }
}
