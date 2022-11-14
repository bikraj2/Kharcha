import 'package:demo2/services/authservices.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:demo2/token/token.dart';

class changePassword extends StatefulWidget {
  const changePassword({super.key});

  @override
  State<changePassword> createState() => _changePasswordState();
}

class _changePasswordState extends State<changePassword> {
  var _oldPasswordController = TextEditingController();
  var _newPasswordController1 = TextEditingController();
  var _newPasswordController2 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          TextField(
            controller: _oldPasswordController,
            decoration: InputDecoration(
              hintText: "Old Password",
            ),
          ),
          SizedBox(
            height: 20,
          ),
          TextField(
            controller: _newPasswordController2,
            decoration: InputDecoration(
              hintText: "New Password",
            ),
          ),
          SizedBox(
            height: 20,
          ),
          TextField(
            controller: _newPasswordController1,
            decoration: InputDecoration(
              hintText: "Confirm Password",
            ),
          ),
          SizedBox(
            height: 20,
          ),
          TextButton(
              onPressed: () async {
                 String oldPassword = _oldPasswordController.text;
                String newPassword = _newPasswordController1.text;
                String confirmPassword = _newPasswordController2.text;
                if (newPassword != confirmPassword) {
                  Fluttertoast.showToast(
                      msg: "The password donot match.",
                      textColor: Colors.white,
                      backgroundColor: Colors.red.shade300);
                } else {
                  try {
                    var tk = await token.storage.read(key: 'jwt');
                    
                    var value = await AuthService()
                        .changePassword(tk as String, oldPassword, newPassword);
                   
                  
                  } catch (e) {
                    
                }
                }
              },
              child: Text("change Password"),),
        ],
      )),
    );
  }
}
