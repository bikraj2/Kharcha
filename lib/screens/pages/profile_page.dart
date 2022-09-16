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
                  'My Transactions',
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
