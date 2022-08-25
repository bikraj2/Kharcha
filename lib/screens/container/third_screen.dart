import 'package:flutter/material.dart';
import 'second_screen.dart';
import 'ready_screen.dart';
import '../log/sign_up.dart';

class ThirdScreen extends StatelessWidget {
  const ThirdScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.all(30),
              child: Column(
                children: <Widget>[
                  TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SecondScreen()));
                      },
                      child: const Image(
                        image: AssetImage(
                          'assetss/images/10.png',
                        ),
                        height: 60,
                        width: 900,
                        alignment: Alignment.topLeft,
                      )),
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
                                  image: AssetImage('assetss/images/chart.png'),
                                  fit: BoxFit.cover)),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const Text('Analyze your Expenses',
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
                                  builder: (context) =>  ReadyScreen()));
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
                        image: AssetImage('assetss/images/7.png'),
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