import 'package:demo2/screens/log/login_screen.dart';
import 'package:demo2/services/authservices.dart';
import 'package:flutter/material.dart';
import 'package:demo2/token/token.dart';
import 'package:fluttertoast/fluttertoast.dart';

class OtpEnter extends StatefulWidget {
  const OtpEnter({super.key});

  @override
  State<OtpEnter> createState() => _OtpEnterState();
}

class _OtpEnterState extends State<OtpEnter> {
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _otpController = TextEditingController();
  bool showPassword = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          showPassword
              ? Container(
                  child: Column(
                    children: [
                      TextField(
                        controller: _passwordController,
                        decoration: InputDecoration(
                          hintText: "New Password",
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      ElevatedButton(
                          onPressed: () async {
                            try {
                              var email =
                                  await token.storage.read(key: 'email');
                              print(email);
                              var res = await AuthService()
                                  .changeForgottenPassword(email as String,
                                      _passwordController.text);
                            } catch (e) {
                              Fluttertoast.showToast(
                                  msg: e.toString(),
                                  textColor: Colors.white,
                                  backgroundColor: Colors.red.shade300);
                            }
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => LoginScreen()));
                          },
                          child: Text("change Password")),
                    ],
                  ),
                )
              : Container(
                  child: Column(
                    children: [
                      TextField(
                        controller: _otpController,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      ElevatedButton(
                          onPressed: () {
                            token.storage.read(key: 'otp').then((value) {
                              if (value == _otpController.text) {
                                setState(() {
                                  showPassword = true;
                                });
                              }
                            });
                          },
                          child: Text("Enter")),
                    ],
                  ),
                ),
        ],
      )),
    );
  }
}
