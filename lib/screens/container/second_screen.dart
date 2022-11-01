import 'package:demo2/screens/bin/top_card.dart';
import 'package:flutter/material.dart';
import 'get_started_screen.dart';
import 'third_screen.dart';
import '../log/sign_up.dart';
import 'package:demo2/theme/theme.dart';

class SecondScreen extends StatelessWidget {
  SecondScreen({Key? key}) : super(key: key);
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
          toolbarHeight: 40,

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
                  // IconButton(
                  //   onPressed: () {
                  //     Navigator.push(
                  //       context,
                  //       MaterialPageRoute(
                  //           builder: (context) => GetStartedScreen()),
                  //     );
                  //   },
                  //   icon: Icon(Icons.arrow_back_ios_new_outlined),
                  //   color: AppTheme.colors.secondarycolor,
                  //   iconSize: 20,
                  //   alignment: Alignment.topLeft,
                  // ),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          width: width / 2,
                          height: height / 1.5,
                          decoration: const BoxDecoration(
                              shape: BoxShape.rectangle,
                              image: DecorationImage(
                                  image: AssetImage('assetss/images/sack.png'),
                                  fit: BoxFit.cover)),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const Text('Plan your Budget',
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
                                  builder: (context) => ThirdScreen()));
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
                              const Color.fromARGB(255, 220, 63, 107)),
                        ),
                        child: const Text(
                          'Next',
                          style: TextStyle(fontSize: 20),
                        ),
                      ),
                      const Image(
                        image: AssetImage('assetss/images/6.png'),
                        height: 70,
                        width: 80,
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextButton(
                        child: const Text(
                          'Skip',
                          style: TextStyle(
                              fontSize: 18,
                              color: Color.fromARGB(255, 220, 63, 107)),
                          textAlign: TextAlign.center,
                        ),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const SignUp()));
                        },
                      ),
                    ],
                  )
                ],
              ),
            )));
  }
}
