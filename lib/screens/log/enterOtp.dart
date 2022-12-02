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
  var _oldPasswordController = TextEditingController();
  var _newPasswordController1 = TextEditingController();
  var _newPasswordController2 = TextEditingController();
  TextEditingController _otpController1 = TextEditingController();
  TextEditingController _otpController2 = TextEditingController();

  TextEditingController _otpController3 = TextEditingController();

  TextEditingController _otpController4 = TextEditingController();

  TextEditingController _otpController5 = TextEditingController();

  bool showPassword = false;
  @override
  Widget build(BuildContext context) {
    Column changePassword = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(Icons.arrow_back_ios),
              iconSize: 20,
            ),
            Container(
              margin: EdgeInsets.only(right: 100),
              child: Text(
                "Change Your Password",
                style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w600,
                    color: AppTheme.colors.secondarycolor),
              ),
            ),
          ],
        ),
        Center(
          child: Column(
            children: [
              IconButton(
                onPressed: () {},
                icon: Image(image: AssetImage("assetss/images/12.png")),
                iconSize: 300,
              ),

              SizedBox(
                height: 20,
              ),
              Container(
                margin: EdgeInsets.only(left: 10, right: 0, bottom: 10),
                padding: EdgeInsets.all(5),
                height: 50,
                width: 250,
                child: TextField(
                  controller: _newPasswordController2,
                  decoration: InputDecoration(
                    labelText: "New Password",
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              // TextField(
              //   controller: _newPasswordController2,
              //   decoration: InputDecoration(
              //     hintText: "New Password",
              //   ),
              // ),
              SizedBox(
                height: 20,
              ),
              Container(
                margin: EdgeInsets.only(left: 10, right: 0, bottom: 10),
                padding: EdgeInsets.all(5),
                height: 50,
                width: 250,
                child: TextField(
                  controller: _newPasswordController1,
                  decoration: InputDecoration(
                      labelText: "Confirm Password",
                      border: OutlineInputBorder()),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              TextButton(
                onPressed: () async {
                  String newPassword = _newPasswordController1.text;
                  String confirmPassword = _newPasswordController2.text;
                  RegExp pass_valid =
                      RegExp(r"(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*\W)");
                  if (newPassword != confirmPassword) {
                    Fluttertoast.showToast(
                        msg: "The password donot match.",
                        textColor: Colors.white,
                        backgroundColor: Colors.red.shade300);
                  } else if (newPassword == "") {
                    Fluttertoast.showToast(
                        msg: "Please enter a newPassword",
                        backgroundColor: Colors.red);
                  } else if (!pass_valid.hasMatch(newPassword)) {
                    Fluttertoast.showToast(
                        msg: "Please enter a Valid Password.",
                        backgroundColor: Colors.red);
                    Future.delayed(const Duration(milliseconds: 1000), () {
                      Fluttertoast.showToast(
                          msg:
                              "Password must Contain 8 letter a speical character, a lower case , an upperCase letter.",
                          backgroundColor: Colors.red);
                    });
                  }
                  {
                    try {
                      var email = await token.storage.read(key: 'email');

                      var value = await AuthService().changeForgottenPassword(
                          email as String, newPassword);
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return LoginScreen();
                      }));
                    } catch (e) {}
                  }
                },
                child: Text("Change Password",
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.w400)),
                style: TextButton.styleFrom(
                    backgroundColor: AppTheme.colors.basecolor,
                    shadowColor: AppTheme.colors.secondarycolor,
                    elevation: 5,
                    shape: BeveledRectangleBorder(
                        borderRadius: BorderRadius.circular(3))),
              ),
            ],
          ),
        ),
      ],
    );
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          children: [
            showPassword
                ? changePassword
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
                                token.storage.read(key: 'otp').then((value) {
                                  String otp = _otpController1.text +
                                      _otpController2.text +
                                      _otpController3.text +
                                      _otpController4.text +
                                      _otpController5.text;
                                  if (value == otp) {
                                    setState(() {
                                      showPassword = true;
                                    });
                                  } else {
                                    Fluttertoast.showToast(
                                        msg: "Wrong OTP",
                                        backgroundColor: Colors.red,
                                        textColor: Colors.white);
                                  }
                                });
                              },
                              child: Text("Enter")),
                        )
                      ],
                    ),
                  )
          ],
        ),
      )),
    );
  }
}
