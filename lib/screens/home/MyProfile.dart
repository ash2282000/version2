import 'package:flutter/material.dart';
import 'package:flutter_app/services/auth.dart';

class MyProfile extends StatefulWidget {
  @override
  _MyProfileState createState() => _MyProfileState();
}

class _MyProfileState extends State<MyProfile> {
  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        child: Center(
          child: TextButton.icon(
            onPressed: () async {
              await _auth.signOut();
            },
            icon: Icon(Icons.account_circle_rounded),
            label: Text('Signout'),
            style: ButtonStyle(

            ),
          ),
        ),
      ),
    );
  }
}
