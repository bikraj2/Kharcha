import 'package:flutter/material.dart';
import 'package:demo2/theme/color.dart';
import 'package:demo2/theme/theme.dart';

import 'second_screen.dart';
import '../users/login_screen.dart';

class GetStartedScreen extends StatelessWidget {
  const GetStartedScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            color: AppTheme.colors.tertiarycolor,
            child: Padding(
              padding: const EdgeInsets.all(30),
              child: Column(
                children: <Widget>[
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          width: 200,
                          height: 200,
                          decoration: const BoxDecoration(
                              shape: BoxShape.rectangle,
                              image: DecorationImage(
                                  image: AssetImage('assetss/images/logo.png'),
                                  fit: BoxFit.cover)),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const Text('Expense Tracking Application',
                            style: TextStyle(
                                fontSize: 22,
                                color: Color.fromARGB(255, 35, 45, 64)))
                      ],
                    ),
                  ),
                  const SizedBox(height: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const SecondScreen()));
                        },
                        style: ButtonStyle(
                          padding: MaterialStateProperty.all(
                            const EdgeInsets.all(10),
                          ),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(18))),
                          backgroundColor: MaterialStateProperty.all(
                              AppTheme.colors.basecolor),
                        ),
                        child: const Text(
                          'Get Started',
                          style: TextStyle(fontSize: 20),
                        ),
                      ),
                      const Image(
                        image: AssetImage('assetss/images/img1.png'),
                        height: 70,
                        width: 80,
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Have an account?',
                        style: TextStyle(
                          fontSize: 18,
                        ),
                      ),
                      TextButton(
                        child: const Text('Login',
                            style: TextStyle(
                                fontSize: 18,
                                color: Color.fromARGB(255, 220, 63, 107))),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const LoginScreen()));
                        },
                      ),
                    ],
                  )
                ],
              ),
            )));
  }
}
