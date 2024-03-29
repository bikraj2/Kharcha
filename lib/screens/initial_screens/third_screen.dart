import 'package:flutter/material.dart';
import 'second_screen.dart';
import 'final_screen.dart';
import '../log/sign_up.dart';
import 'package:demo2/theme/theme.dart';

class ThirdScreen extends StatelessWidget {
  ThirdScreen({Key? key}) : super(key: key);
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
                  // IconButton(
                  //   onPressed: () {
                  //     Navigator.push(
                  //       context,
                  //       MaterialPageRoute(builder: (context) => SecondScreen()),
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
                              image: AssetImage("assetss/images/chart.png")),
                          iconSize: 300,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text('Analyze your Expenses',
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
                                  builder: (context) => ReadyScreen()));
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
                          'Next',
                          style: TextStyle(fontSize: 20),
                        ),
                      ),
                      Image(
                        image: AssetImage('assetss/images/7.png'),
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
                              fontSize: 16,
                              decoration: TextDecoration.underline,
                              color: AppTheme.colors.basecolor),
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
// import 'package:flutter/widgets.dart';

// class FrameSize {
//   //init method is static so no object creation is required
//   static void init({
//     required context,
//   }) {
//     _mediaQueryData = MediaQuery.of(context);
//     height = _mediaQueryData.size.height;
//     width = _mediaQueryData.size.width;
//   }

//   static late double width;
//   static late double height;
//   static late MediaQueryData _mediaQueryData;
// }