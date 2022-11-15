import 'package:demo2/services/authservices.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:demo2/token/token.dart';

import '../../theme/theme.dart';
import '../pages/home_screen.dart';

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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (BuildContext context) {
                          return HomeScreen();
                        },
                      ),
                    );
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
                  Container(
                    margin: EdgeInsets.only(left: 10, right: 0, bottom: 10),
                    padding: EdgeInsets.all(5),
                    height: 50,
                    width: 250,
                    child: TextField(
                      controller: _oldPasswordController,
                      decoration: InputDecoration(
                          labelText: "Old Password",
                          border: OutlineInputBorder()),
                    ),
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

                          var value = await AuthService().changePassword(
                              tk as String, oldPassword, newPassword);
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
        ),
      ),
    );
  }
}
