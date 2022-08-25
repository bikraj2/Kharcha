import 'package:demo2/screens/bin/top_card.dart';
import 'package:flutter/material.dart';

import '../../theme/theme.dart';

class ProfilePage extends StatefulWidget {
  ProfilePage({Key? key}) : super(key: key);
  var orientation, size, height, width;

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 200,
          height: 80,
          margin: EdgeInsets.only(top: 20),
          decoration: const BoxDecoration(
              shape: BoxShape.rectangle,
              image: DecorationImage(
                  image: AssetImage('assetss/images/profile.png'),
                  fit: BoxFit.cover)),
        ),
        Container(
          child: Text('Username'),
        ),
        TopNewCard(),
        Padding(
          padding: EdgeInsets.only(left: 30, right: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  // Navigator.push(
                  //     context,
                  //     MaterialPageRoute(
                  //         builder: (context) => ));
                },
                style: ButtonStyle(
                  padding: MaterialStateProperty.all(
                    const EdgeInsets.all(10),
                  ),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18))),
                  backgroundColor:
                      MaterialStateProperty.all(AppTheme.colors.tertiarycolor),
                  foregroundColor: MaterialStateProperty.resolveWith<Color>(
                      (Set<MaterialState> states) {
                    if (states.contains(MaterialState.hovered))
                      return Colors.white;
                    return AppTheme.colors.basecolor;
                  }),
                  overlayColor: MaterialStateProperty.resolveWith<Color?>(
                    (Set<MaterialState> states) {
                      if (states.contains(MaterialState.hovered))
                        return AppTheme.colors.basecolor; //<-- SEE HERE
                      return AppTheme.colors
                          .tertiarycolor; // Defer to the widget's default.
                    },
                  ),
                ),
                child: const Text(
                  'Personal Details',
                  style: TextStyle(
                    fontSize: 14,
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              ElevatedButton(
                onPressed: () {
                  // Navigator.push(
                  //     context,
                  //     MaterialPageRoute(
                  //         builder: (context) => SecondScreen()));
                },
                style: ButtonStyle(
                  padding: MaterialStateProperty.all(
                    const EdgeInsets.all(10),
                  ),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18))),
                  backgroundColor:
                      MaterialStateProperty.all(AppTheme.colors.tertiarycolor),
                  foregroundColor: MaterialStateProperty.resolveWith<Color>(
                      (Set<MaterialState> states) {
                    if (states.contains(MaterialState.hovered))
                      return Colors.white;
                    return AppTheme.colors.basecolor;
                  }),
                  overlayColor: MaterialStateProperty.resolveWith<Color?>(
                    (Set<MaterialState> states) {
                      if (states.contains(MaterialState.hovered))
                        return AppTheme.colors.basecolor; //<-- SEE HERE
                      return AppTheme.colors
                          .tertiarycolor; // Defer to the widget's default.
                    },
                  ),
                ),
                child: const Text(
                  'My Transactions',
                  style: TextStyle(
                    fontSize: 14,
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              ElevatedButton(
                onPressed: () {
                  // Navigator.push(
                  //     context,
                  //     MaterialPageRoute(
                  //         builder: (context) => SecondScreen()));
                },
                style: ButtonStyle(
                  padding: MaterialStateProperty.all(
                    const EdgeInsets.all(10),
                  ),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18))),
                  backgroundColor:
                      MaterialStateProperty.all(AppTheme.colors.tertiarycolor),
                  foregroundColor: MaterialStateProperty.resolveWith<Color>(
                      (Set<MaterialState> states) {
                    if (states.contains(MaterialState.hovered))
                      return Colors.white;
                    return AppTheme.colors.basecolor;
                  }),
                  overlayColor: MaterialStateProperty.resolveWith<Color?>(
                    (Set<MaterialState> states) {
                      if (states.contains(MaterialState.hovered))
                        return AppTheme.colors.basecolor; //<-- SEE HERE
                      return AppTheme.colors
                          .tertiarycolor; // Defer to the widget's default.
                    },
                  ),
                ),
                child: const Text(
                  'Logout',
                  style: TextStyle(
                    fontSize: 14,
                  ),
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}
