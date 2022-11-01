import 'package:flutter/material.dart';

class ResetPassword extends StatelessWidget {
  const ResetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.only(right: 20, left: 20),
            child: TextField(
              decoration: InputDecoration(hintText: "New Password"),
            ),
          ),
          Container(
            padding: EdgeInsets.only(right: 20, left: 20),
            child: TextField(
              decoration: InputDecoration(hintText: "Confirm Password"),
            ),
          ),
          ElevatedButton(onPressed: (){}, child: Text('Change Password'))
        ],
      ),
    );
  }
}
