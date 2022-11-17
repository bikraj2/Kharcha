import 'package:demo2/screens/log/login_screen.dart';
import 'package:demo2/services/authservices.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
        backgroundColor: AppTheme.colors.secondarycolor,
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
            const SizedBox(
              height: 20,
            ),
            TextField(
              controller: firstNameController,
              style: const TextStyle(fontSize: 18, color: Colors.black54),
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                labelText: 'Firstname',
                contentPadding: const EdgeInsets.all(15),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            TextField(
              controller: middleNameController,
              obscureText: true,
              style: const TextStyle(fontSize: 18, color: Colors.black54),
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                labelText: 'MiddleName',
                contentPadding: const EdgeInsets.all(15),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            TextField(
              controller: lastNameController,
              style: const TextStyle(fontSize: 18, color: Colors.black54),
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                labelText: 'Lastname',
                contentPadding: const EdgeInsets.all(15),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              width: 200,
              child: TextField(
                controller: emailController,
                obscureText: true,
                style: const TextStyle(fontSize: 18, color: Colors.black54),
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  labelText: 'email',
                  contentPadding: const EdgeInsets.all(15),
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            TextField(
              controller: usernameController,
              style: const TextStyle(fontSize: 18, color: Colors.black54),
              decoration: InputDecoration(
                filled: true,
                fillColor: AppTheme.colors.tertiarycolor,
                labelText: 'Username',
                contentPadding: const EdgeInsets.all(15),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            TextField(
              controller: passwordController,
              obscureText: true,
              style: const TextStyle(fontSize: 18, color: Colors.black54),
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                labelText: 'Password',
                contentPadding: const EdgeInsets.all(15),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () {
                Users newuser = Users(
                    firstNameController.text,
                    middleNameController.text,
                    lastNameController.text,
                    emailController.text,
                    usernameController.text,
                    passwordController.text);
                AuthService().addUser(newuser).then((val) {
                  if (val.data["success"]) {
                    dispose();
                    Fluttertoast.showToast(msg: val.data['msg']);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const LoginScreen()),
                    );
                  } else {
                    Fluttertoast.showToast(msg: val.data['msg']);
                  }
                });
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
