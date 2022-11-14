import 'package:demo2/screens/log/changePassword.dart';
import 'package:demo2/screens/profile/top_card.dart';
import 'package:demo2/screens/log/login_screen.dart';
import 'package:demo2/services/authservices.dart';
import 'package:demo2/token/token.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../theme/theme.dart';

class ProfilePage extends StatefulWidget {
  ProfilePage({Key? key}) : super(key: key);
  var orientation, size, height, width;

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

final _dateController = TextEditingController();
final _moneyController = TextEditingController();

var orientation, height, size, width;

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    orientation = MediaQuery.of(context).orientation;
    //size of the window
    size = MediaQuery.of(context).size;
    height = size.height;
    width = size.width;
    return Column(
      children: [
        profilePicture(),
        const Text('Username'),
        const TopNewCard(),
        Padding(
          padding: const EdgeInsets.only(left: 30, right: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 20),
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
                    if (states.contains(MaterialState.hovered)) {
                      return Colors.white;
                    }
                    return AppTheme.colors.basecolor;
                  }),
                  overlayColor: MaterialStateProperty.resolveWith<Color?>(
                    (Set<MaterialState> states) {
                      if (states.contains(MaterialState.hovered)) {
                        return AppTheme.colors.basecolor;
                      } //<-- SEE HERE
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
              const SizedBox(
                height: 10,
              ),
              ElevatedButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: Text("Add income"),
                      actions: [
                        Container(
                            width: width,
                            height: height / 8,
                            padding: EdgeInsets.all(15),
                            margin: EdgeInsets.only(top: 10),
                            child: TextField(
                                controller: _moneyController,
                                decoration: InputDecoration(
                                    labelText: 'Income ',
                                    border: OutlineInputBorder(),
                                    suffixIcon: IconButton(
                                      onPressed: () {
                                        _moneyController.clear();
                                      },
                                      icon: Icon(Icons.clear),
                                      iconSize: 14,
                                    )))),
                        Center(
                          child: Container(
                              padding: EdgeInsets.all(15),
                              child: ElevatedButton(
                                  style: ButtonStyle(),
                                  // shape: BeveledRectangleBorder(
                                  //     borderRadius: BorderRadius.all(Radius.circular(5))),
                                  // hoverColor: AppTheme.colors.basecolor,
                                  // backgroundColor: AppTheme.colors.secondarycolor,
                                  child: const Text(
                                    "Save",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w600),
                                  ),
                                  onPressed: () {
                                    token.storage
                                        .read(key: 'jwt')
                                        .then((value) => {
                                              AuthService()
                                                  .addIncome(
                                                      value as String,
                                                      double.parse(
                                                          _moneyController
                                                              .text))
                                                  .then((value) {
                                                if (value.data['success']) {
                                                  Fluttertoast.showToast(
                                                      msg: value.data['msg'],
                                                      textColor: Colors.white,
                                                      backgroundColor: Colors
                                                          .green.shade300);
                                                } else {
                                                  Fluttertoast.showToast(
                                                      msg: value.data['msg'],
                                                      textColor: Colors.white,
                                                      backgroundColor:
                                                          Colors.red.shade300);
                                                }
                                              })
                                            });
                                  })),
                        )
                      ],
                    ),
                  );
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
                    if (states.contains(MaterialState.hovered)) {
                      return Colors.white;
                    }
                    return AppTheme.colors.basecolor;
                  }),
                  overlayColor: MaterialStateProperty.resolveWith<Color?>(
                    (Set<MaterialState> states) {
                      if (states.contains(MaterialState.hovered)) {
                        return AppTheme.colors.basecolor;
                      } //<-- SEE HERE
                      return AppTheme.colors
                          .tertiarycolor; // Defer to the widget's default.
                    },
                  ),
                ),
                child: const Text(
                  'MY BUDGET',
                  style: TextStyle(
                    fontSize: 14,
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => changePassword()));
                  },
                  child: Text("Change Password")),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => LoginScreen()));
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
                    if (states.contains(MaterialState.hovered)) {
                      return Colors.white;
                    }
                    return AppTheme.colors.basecolor;
                  }),
                  overlayColor: MaterialStateProperty.resolveWith<Color?>(
                    (Set<MaterialState> states) {
                      if (states.contains(MaterialState.hovered)) {
                        return AppTheme.colors.basecolor;
                      } //<-- SEE HERE
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

  Widget bottomCard() {
    return Container(
      height: 100,
      width: MediaQuery.of(context).size.width,
      margin: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 20,
      ),
      child: Column(
        children: [
          const Text("Choose Profile Picture", style: TextStyle(fontSize: 20)),
          const SizedBox(
            height: 20,
          ),
          Row(
            children: [
              TextButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.camera),
                  label: const Text('Camera')),
              TextButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.image),
                  label: const Text('Gallery'))
            ],
          ),
        ],
      ),
    );
  }

  Widget profilePicture() {
    return Center(
      child: Stack(
        children: [
          // CircleAvatar(
          //   radius: 45,
          //   backgroundColor: AppTheme.colors.basecolor,
          // ),
          const Image(
            image: AssetImage("assetss/images/profile.png"),
            height: 100,
            width: 100,
          ),
          Positioned(
              bottom: 20,
              right: 10,
              child: InkWell(
                  onTap: () {
                    showModalBottomSheet(
                        context: context, builder: ((builder) => bottomCard()));
                  },
                  child: Icon(
                    Icons.camera_alt,
                    color: AppTheme.colors.secondarycolor,
                    size: 15,
                  )))
        ],
      ),
    );
  }
}
