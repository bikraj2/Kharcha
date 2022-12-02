import 'package:demo2/screens/log/login_screen.dart';
import 'package:demo2/services/authservices.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:validators/validators.dart';
import '../../models/user_info.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:demo2/theme/theme.dart';

class SignUp extends StatefulWidget {
  SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

TextEditingController firstNameController = TextEditingController();
TextEditingController middleNameController = TextEditingController();
TextEditingController lastNameController = TextEditingController();
TextEditingController emailController = TextEditingController();
TextEditingController usernameController = TextEditingController();
TextEditingController passwordController = TextEditingController();
void dipose() {
  usernameController.dispose();
  passwordController.dispose();
  firstNameController.dispose();
  middleNameController.dispose();
  lastNameController.dispose();
  emailController.dispose();
}

class _SignUpState extends State<SignUp> {
  var orientation, size, height, width;
  @override
  Widget build(BuildContext context) {
    orientation = MediaQuery.of(context).orientation;
    size = MediaQuery.of(context).size;
    width = size.width;
    height = size.height;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppTheme.colors.basecolor,
        title: Text('Sign Up'),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          color: Colors.white,
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            IconButton(
              onPressed: () {},
              icon: Image(
                  image: AssetImage(
                'assetss/images/loginn.png',
              )),
              iconSize: 250,
            ),
            Container(
              height: 10,
            ),
            Container(
              padding: EdgeInsets.all(10),
              child: Column(
                children: [
                  Container(
                    width: 260,
                    height: 40,
                    child: TextField(
                      controller: firstNameController,
                      style:
                          const TextStyle(fontSize: 18, color: Colors.black54),
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        labelText: 'Firstname',
                        contentPadding: const EdgeInsets.all(15),
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                  Container(
                    height: 10,
                  ),
                  Container(
                    width: 260,
                    height: 40,
                    child: TextField(
                      controller: middleNameController,
                      style:
                          const TextStyle(fontSize: 18, color: Colors.black54),
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        labelText: 'MiddleName',
                        contentPadding: const EdgeInsets.all(15),
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                  Container(
                    height: 10,
                  ),
                  Container(
                    width: 260,
                    height: 40,
                    child: TextField(
                      controller: lastNameController,
                      style:
                          const TextStyle(fontSize: 18, color: Colors.black54),
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        labelText: 'Lastname',
                        contentPadding: const EdgeInsets.all(15),
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                  Container(
                    height: 10,
                  ),
                  Container(
                    width: 260,
                    height: 40,
                    child: TextField(
                      controller: emailController,
                      style:
                          const TextStyle(fontSize: 18, color: Colors.black54),
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        labelText: 'Email',
                        contentPadding: const EdgeInsets.all(15),
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                  Container(
                    height: 10,
                  ),
                  Container(
                    width: 260,
                    height: 40,
                    child: TextField(
                      controller: usernameController,
                      style:
                          const TextStyle(fontSize: 18, color: Colors.black54),
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: AppTheme.colors.tertiarycolor,
                        labelText: 'Username',
                        contentPadding: const EdgeInsets.all(15),
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                  Container(
                    height: 10,
                  ),
                  Container(
                    width: 260,
                    height: 40,
                    child: TextField(
                      controller: passwordController,
                      obscureText: true,
                      style:
                          const TextStyle(fontSize: 18, color: Colors.black54),
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        labelText: 'Password',
                        contentPadding: const EdgeInsets.all(15),
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: 10,
            ),
            TextButton(
              onPressed: () {
                String firstName = firstNameController.text;
                String middleName = middleNameController.text;
                String lastName = lastNameController.text;
                String email = emailController.text;
                String username = usernameController.text;
                String password = passwordController.text;
                Users newuser = Users(
                    firstName, middleName, lastName, email, username, password);
                    RegExp pass_valid =
                    RegExp(r"(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*\W)");
                if (firstName == "") {
                  Fluttertoast.showToast(
                      msg: "Please enter a FirstName.",
                      backgroundColor: Colors.red);
                } else if (lastName == "") {
                  Fluttertoast.showToast(
                      msg: "Please enter a lastName.",
                      backgroundColor: Colors.red);
                } else if (email == "") {
                  Fluttertoast.showToast(
                      msg: "Please enter an email.",
                      backgroundColor: Colors.red);
                } else if (!isEmail(email)) {
                  Fluttertoast.showToast(
                      msg: "Please enter a valid email",
                      backgroundColor: Colors.red);
                } else if (username == "") {
                  Fluttertoast.showToast(
                      msg: "Please enter a username",
                      backgroundColor: Colors.red);
                } else if (username.length < 8) {
                    Fluttertoast.showToast(
                        msg:
                            "Please enter a username longer than 8 characters.",
                        backgroundColor: Colors.red);
                  
                } else if (password == "") {
                  Fluttertoast.showToast(
                      msg: "Please enter a password",
                      backgroundColor: Colors.red);
                } else if (!pass_valid.hasMatch(password)) {
                    Fluttertoast.showToast(
                        msg: "Please enter a Valid Password.",
                        backgroundColor: Colors.red);
                    Future.delayed(const Duration(milliseconds: 1000), () {
                      Fluttertoast.showToast(
                          msg:
                              "Password must Contain 8 letter a speical character, a lower case , an upperCase letter.",
                          backgroundColor: Colors.red);
                    });
                  
                } else {
                  AuthService().addUser(newuser).then((val) {
                    if (val.data["success"]) {
                      dispose();
                      Fluttertoast.showToast(msg: "User Created.",backgroundColor: Colors.green,textColor: Colors.white);
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const LoginScreen()),
                      );
                    } else {
                      Fluttertoast.showToast(msg: val.data['msg']);
                    }
                  });
                }
              },
              child: const Text(
                'Sign Up',
                style: TextStyle(fontSize: 20),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
