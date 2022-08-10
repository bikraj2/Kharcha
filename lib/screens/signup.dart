import 'package:demo2/services/authservices.dart';
import 'package:fluttertoast/fluttertoast.dart';

import './home.dart';
import 'package:flutter/material.dart';
import '../main.dart';

class SignUpApp extends StatelessWidget {
  static const String _title = 'Sign Up Page';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: _title,
      home: Scaffold(
        appBar: AppBar(
          title: const Text(_title),
          automaticallyImplyLeading: false,
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.orange),
            onPressed: () => Navigator.of(context).pop(),
          ),
          backgroundColor: Colors.green,
        ),
        body: const SignUp(),
      ),
    );
  }
}

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => SignUpState();
}

class SignUpState extends State<SignUp> {
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.all(10),
            child: const Text(
              'Kharcha Sign Up',
              style: TextStyle(
                  color: Colors.green,
                  fontWeight: FontWeight.w500,
                  fontSize: 30),
            )),
        Container(
          height: 50,
          padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
          child: TextField(
            controller: nameController,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'User Name',
            ),
          ),
        ),
        // Container(
        //   height: 50,
        //   padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
        //   child: TextField(
        //     controller: nameController,
        //     decoration: const InputDecoration(
        //       border: OutlineInputBorder(),
        //       labelText: 'DOB',
        //     ),
        //   ),
        // ),
        // Container(
        //   height: 50,
        //   padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
        //   child: TextField(
        //     controller: nameController,
        //     decoration: const InputDecoration(
        //       border: OutlineInputBorder(),
        //       labelText: 'Email',
        //     ),
        //   ),
        // ),
        Container(
          height: 50,
          padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
          child: TextField(
            controller: passwordController,
            decoration: const InputDecoration(
                border: OutlineInputBorder(), labelText: 'Password'),
          ),
        ),
        Container(
            height: 50,
            padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
            child: ElevatedButton(
              child: const Text('Create Account'),
              onPressed: () {
                AuthService()
                    .addUser(
                        nameController.text, (passwordController.text))
                    .then((val) {
                  if (val.data['success']) {
                    Fluttertoast.showToast(msg: val.data['msg']);
                  } else {
                    Fluttertoast.showToast(msg: "not done");
                  }
                });
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.green,
              ),
            )),
      ],
    ));
  }
}
