import 'package:demo2/screens/log/enterOtp.dart';
import 'package:demo2/services/authservices.dart';
import 'package:flutter/material.dart';
import 'package:demo2/token/token.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ForgotPasswowrd extends StatefulWidget {
  const ForgotPasswowrd({super.key});

  @override
  State<ForgotPasswowrd> createState() => _ForgotPasswowrdState();
}

class _ForgotPasswowrdState extends State<ForgotPasswowrd> {
  TextEditingController _emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Column(
        children: [
          TextField(
            controller: _emailController,
            decoration: InputDecoration(hintText: "Enter your email."),
          ),
          SizedBox(
            height: 20,
          ),
          TextButton(
              onPressed: () async {
                try {
                  var tk = await token.storage.read(key: 'jwt');
                  var res = await AuthService()
                      .forgotPasswowrd(tk, _emailController.text);
                  if (res.data['success']) {
                    
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => OtpEnter()));
                  }
                } catch (e) {
                  Fluttertoast.showToast(
                      msg: e.toString(),
                      textColor: Colors.white,
                      backgroundColor: Colors.red.shade300);
                }
              },
              child: Text("Send Token"))
        ],
      ),
    ));
  }
}
