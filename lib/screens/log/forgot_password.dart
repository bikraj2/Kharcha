import 'package:flutter/material.dart';

class ForgotPassword extends StatefulWidget {
  @override
  State<ForgotPassword> createState() => ForgotPasswordState();
}

class ForgotPasswordState extends State<ForgotPassword> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Container(
              padding: EdgeInsets.only(right: 20, left: 20),
              child: TextField(
                decoration: InputDecoration(hintText: "Enter your Email"),
              ),
            ),
            ElevatedButton(
                onPressed: () {},
                child: Text(
                  "Send verification Code",
                ))
          ]),
        ),
      ),
    );
  }
}
