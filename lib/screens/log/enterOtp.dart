import 'package:demo2/screens/log/forgotPassword.dart';
import 'package:demo2/screens/log/login_screen.dart';
import 'package:demo2/services/authservices.dart';
import 'package:flutter/material.dart';
import 'package:demo2/token/token.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../theme/theme.dart';

class OtpEnter extends StatefulWidget {
  const OtpEnter({super.key});

  @override
  State<OtpEnter> createState() => _OtpEnterState();
}

class _OtpEnterState extends State<OtpEnter> {
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _otpController1 = TextEditingController();
  TextEditingController _otpController2 = TextEditingController();

  TextEditingController _otpController3 = TextEditingController();

  TextEditingController _otpController4 = TextEditingController();

  TextEditingController _otpController5 = TextEditingController();

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
              : SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      IconButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => ForgotPassword()));
                          },
                          icon: Icon(Icons.arrow_back_ios)),
                      Center(
                          child: Image(
                        image: AssetImage("assetss/images/verification.jpeg"),
                      )),
                      Container(
                        padding: EdgeInsets.all(5),
                        margin: EdgeInsets.all(10),
                        child: Text(
                          "Verification Code",
                          style: TextStyle(
                            fontSize: 18,
                            color: AppTheme.colors.basecolor,
                          ),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.all(5),
                        margin: EdgeInsets.only(left: 10),
                        child: Text(
                          "We have sent the OTP code to the email",
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: AppTheme.colors.secondarycolor,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 40,
                      ),
                      Form(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            SizedBox(
                              height: 45,
                              width: 40,
                              child: TextFormField(
                                onChanged: (value) {
                                  if (value.length == 1) {
                                    FocusScope.of(context).nextFocus();
                                  }
                                },
                                decoration: InputDecoration(
                                  hintText: "0",
                                  hintStyle: TextStyle(
                                      color: Colors.grey,
                                      fontWeight: FontWeight.w200),
                                  border: OutlineInputBorder(),
                                ),
                                style: Theme.of(context).textTheme.headline6,
                                keyboardType: TextInputType.number,
                                textAlign: TextAlign.center,
                                inputFormatters: [
                                  LengthLimitingTextInputFormatter(1),
                                ],
                                controller: _otpController1,
                              ),
                            ),
                            SizedBox(
                              height: 45,
                              width: 40,
                              child: TextFormField(
                                onChanged: (value) {
                                  if (value.length == 1) {
                                    FocusScope.of(context).nextFocus();
                                  }
                                },
                                decoration: InputDecoration(
                                  hintText: "0",
                                  hintStyle: TextStyle(
                                      color: Colors.grey,
                                      fontWeight: FontWeight.w200),
                                  border: OutlineInputBorder(),
                                ),
                                style: Theme.of(context).textTheme.headline6,
                                keyboardType: TextInputType.number,
                                textAlign: TextAlign.center,
                                inputFormatters: [
                                  LengthLimitingTextInputFormatter(1),
                                ],
                                controller: _otpController2,
                              ),
                            ),
                            SizedBox(
                              height: 45,
                              width: 40,
                              child: TextFormField(
                                onChanged: (value) {
                                  if (value.length == 1) {
                                    FocusScope.of(context).nextFocus();
                                  }
                                },
                                decoration: InputDecoration(
                                  hintStyle: TextStyle(
                                      color: Colors.grey,
                                      fontWeight: FontWeight.w200),
                                  border: OutlineInputBorder(),
                                  hintText: "0",
                                ),
                                style: Theme.of(context).textTheme.headline6,
                                keyboardType: TextInputType.number,
                                textAlign: TextAlign.center,
                                inputFormatters: [
                                  LengthLimitingTextInputFormatter(1),
                                ],
                                controller: _otpController3,
                              ),
                            ),
                            SizedBox(
                              height: 45,
                              width: 40,
                              child: TextFormField(
                                onChanged: (value) {
                                  if (value.length == 1) {
                                    FocusScope.of(context).nextFocus();
                                  }
                                },
                                decoration: InputDecoration(
                                  hintText: "0",
                                  hintStyle: TextStyle(
                                      color: Colors.grey,
                                      fontWeight: FontWeight.w200),
                                  border: OutlineInputBorder(),
                                ),
                                style: Theme.of(context).textTheme.headline6,
                                keyboardType: TextInputType.number,
                                textAlign: TextAlign.center,
                                inputFormatters: [
                                  LengthLimitingTextInputFormatter(1),
                                ],
                                controller: _otpController4,
                              ),
                            ),
                            SizedBox(
                              height: 45,
                              width: 40,
                              child: TextFormField(
                                onChanged: (value) {
                                  if (value.length == 1) {
                                    FocusScope.of(context).nextFocus();
                                  }
                                },
                                decoration: InputDecoration(
                                  hintText: "0",
                                  hintStyle: TextStyle(
                                      color: Colors.grey,
                                      fontWeight: FontWeight.w200),
                                  fillColor: AppTheme.colors.backgroundcolor,
                                  border: OutlineInputBorder(),
                                ),
                                style: Theme.of(context).textTheme.headline6,
                                keyboardType: TextInputType.number,
                                textAlign: TextAlign.center,
                                inputFormatters: [
                                  LengthLimitingTextInputFormatter(1),
                                ],
                                controller: _otpController5,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 40,
                      ),
                      Center(
                        child: ElevatedButton(
                            onPressed: () {
                              // token.storage.read(key: 'otp').then((value) {
                              //   if (value == _otpController.text) {
                              //     setState(() {
                              //       showPassword = true;
                              //     });
                              //   }
                              // });
                            },
                            child: Text("Enter")),
                      )
                    ],
                  ),
                )
        ],
      )),
    );
  }
}
