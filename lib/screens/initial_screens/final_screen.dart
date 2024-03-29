import 'package:flutter/material.dart';
import 'third_screen.dart';
import '../log/sign_up.dart';
import 'package:demo2/theme/theme.dart';

class ReadyScreen extends StatelessWidget {
  ReadyScreen({Key? key}) : super(key: key);
  var orientation, size, height, width;

  @override
  Widget build(BuildContext context) {
    orientation = MediaQuery.of(context).orientation;

    //size of the window
    size = MediaQuery.of(context).size;
    height = size.height;
    width = size.width;
    return Scaffold(
        appBar: AppBar(
          // title: Text('Login'),
          toolbarHeight: width / 9.5,

          elevation: 0,
          backgroundColor: AppTheme.colors.basecolor,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ),
        body: Container(
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.all(30),
              child: Column(
                children: <Widget>[
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        IconButton(
                          onPressed: () {},
                          icon: Image(
                              image: AssetImage("assetss/images/tick.png")),
                          iconSize: 300,
                        ),
                        const SizedBox(
                          height: 0,
                        ),
                        Text("Let's Get Started !",
                            style: TextStyle(
                                fontSize: 22,
                                color: AppTheme.colors.secondarycolor,
                                fontWeight: FontWeight.w600))
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
                                  builder: (context) => SignUp()));
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
                          'Sign Up',
                          style: TextStyle(fontSize: 20),
                        ),
                      ),
                      const Image(
                        image: AssetImage('assetss/images/11.png'),
                        height: 70,
                        width: 80,
                      )
                    ],
                  ),
                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.center,
                  //   children: [
                  //     TextButton(
                  //       child: const Text(
                  //         'Skip',
                  //         style: TextStyle(
                  //             fontSize: 18,
                  //             color: Color.fromARGB(255, 220, 63, 107)),
                  //         textAlign: TextAlign.center,
                  //       ),
                  //       onPressed: () {},
                  //     ),
                  //   ],
                  // )
                ],
              ),
            )));
  }
}
