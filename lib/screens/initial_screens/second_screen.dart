import 'package:demo2/screens/profile/top_card.dart';
import 'package:flutter/material.dart';
import 'first_screen.dart';
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
                        IconButton(
                          onPressed: () {},
                          icon: Image(
                              image: AssetImage("assetss/images/sack.png")),
                          iconSize: 300,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text('Plan your Budget',
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
                                  builder: (context) => ThirdScreen()));
                        },
                        style: ButtonStyle(
                          padding: MaterialStateProperty.all(
                            const EdgeInsets.all(10),
                          ),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(width / 2))),
                          backgroundColor: MaterialStateProperty.all(
                              AppTheme.colors.basecolor),
                        ),
                        child: const Text(
                          'Next',
                          style: TextStyle(fontSize: 18),
                        ),
                      ),
                      Image(
                        image: AssetImage('assetss/images/6.png'),
                        height: height / 10,
                        width: width / 5,
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextButton(
                        child: Text(
                          'Skip',
                          style: TextStyle(
                              decoration: TextDecoration.underline,
                              fontSize: 15,
                              color: AppTheme.colors.basecolor,
                              fontWeight: FontWeight.w600),
                          textAlign: TextAlign.center,
                        ),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => SignUp()));
                        },
                      ),
                    ],
                  )
                ],
              ),
            )));
  }
}
