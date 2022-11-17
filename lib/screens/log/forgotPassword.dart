import 'package:demo2/screens/charts/graphs_page.dart';
import 'package:demo2/screens/log/enterOtp.dart';
import 'package:demo2/screens/log/login_screen.dart';
import 'package:demo2/services/authservices.dart';
import 'package:demo2/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:demo2/token/token.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ForgotPassword extends StatefulWidget {
  ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _otpController = TextEditingController();
  bool showPassword = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              IconButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (BuildContext context) {
                        return LoginScreen();
                      },
                    ),
                  );
                },
                icon: Icon(Icons.arrow_back_ios),
                iconSize: 20,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Center(
                    child: Container(
                      padding: EdgeInsets.all(5),
                      margin: EdgeInsets.all(10),
                      child: Text(
                        "Forgot your Password?",
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                            color: AppTheme.colors.secondarycolor),
                      ),
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Image(
                      image: AssetImage("assetss/images/forgot.png"),
                    ),
                    iconSize: 350,
                  ),
                  Container(
                    padding: EdgeInsets.all(10),
                    margin: EdgeInsets.only(left: 20, right: 20),
                    child: Text(
                      "Please enter your email to recieve the token!",
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: AppTheme.colors.secondarycolor),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 10, right: 0, bottom: 10),
                    padding: EdgeInsets.all(5),
                    height: 50,
                    width: 200,
                    child: TextField(
                      controller: _emailController,
                      decoration:
                          InputDecoration(hintText: "Enter your email."),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextButton(
                    onPressed: () async {
                      try {
                        var tk = await token.storage.read(key: 'jwt');
                        var res = await AuthService()
                            .ForgotPassword(tk, _emailController.text);
                        if (res.data['success']) {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => OtpEnter()));
                        }
                      } catch (e) {
                        Fluttertoast.showToast(
                            msg: e.toString(),
                            textColor: Colors.white,
                            backgroundColor: Colors.red.shade300);
                      }
                    },
                    child: Text(
                      "Send OTP",
                      style: TextStyle(color: Colors.white),
                    ),
                    style: TextButton.styleFrom(
                        backgroundColor: AppTheme.colors.basecolor,
                        shadowColor: AppTheme.colors.secondarycolor,
                        elevation: 5,
                        shape: BeveledRectangleBorder(
                            borderRadius: BorderRadius.circular(2))),
                  )
                ],
              ),
            ]),
      )),
    );
  }
}
