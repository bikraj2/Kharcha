// import 'package:demo2/screens/bin/home_page.dart';
import 'package:demo2/screens/log/login_screen.dart';
import 'package:flutter/material.dart';
// import 'package:demo2/theme/color.dart';
import 'package:demo2/theme/theme.dart';

import '../pages/home_screen.dart';
import 'second_screen.dart';
// import '../log/login_screen.dart';

class GetStartedScreen extends StatelessWidget {
  GetStartedScreen({Key? key}) : super(key: key);
  var orientation, size, height, width;

  // ignore: prefer_typing_uninitialized_variables

  @override
  Widget build(BuildContext context) {
    orientation = MediaQuery.of(context).orientation;

    //size of the window
    size = MediaQuery.of(context).size;
    height = size.height;
    width = size.width;

    return Scaffold(
        appBar: AppBar(
          toolbarHeight: 40,
        ),
        body: Container(
            color: AppTheme.colors.tertiarycolor,
            child: Padding(
              padding: const EdgeInsets.all(30),
              child: Column(
                children: <Widget>[
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      IconButton(
                        onPressed: () {},
                        icon: Image(
                            image: AssetImage("assetss/images/login.png")),
                        iconSize: 300,
                      ),
                      // Container(
                      //   width: width / 2,
                      //   height: height / 2,
                      //   decoration: const BoxDecoration(
                      //       image: DecorationImage(
                      //           image: AssetImage('assetss/images/login.png'),
                      //           fit: BoxFit.contain)),
                      // ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text('Expense Tracking Application',
                          style: TextStyle(
                              fontSize: 22,
                              color: AppTheme.colors.secondarycolor,
                              fontWeight: FontWeight.w600))
                    ],
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        SizedBox(
                          height: 60,
                        ),
                        ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => SecondScreen()));
                          },
                          style: ButtonStyle(
                            padding: MaterialStateProperty.all(
                              const EdgeInsets.all(10),
                            ),
                            shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15))),
                            backgroundColor: MaterialStateProperty.all(
                                AppTheme.colors.basecolor),
                          ),
                          child: const Text(
                            'Get Started',
                            style: TextStyle(fontSize: 20),
                          ),
                        ),
                        Image(
                          image: AssetImage('assetss/images/img1.png'),
                          height: height / 10,
                          width: width / 5,
                        )
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Text(
                        'Have an account?',
                        style: TextStyle(
                          fontSize: 18,
                        ),
                      ),
                      TextButton(
                        child: Text('Login',
                            style: TextStyle(
                                fontSize: 18,
                                decoration: TextDecoration.underline,
                                color: AppTheme.colors.basecolor)),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => LoginScreen()));
                        },
                      ),
                    ],
                  )
                ],
              ),
            )));
  }
}
