import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/models/userr.dart';
import 'package:flutter_app/screens/authenticate/Authenticate.dart';
import 'package:flutter_app/screens/home/MainPage.dart';
import 'package:provider/provider.dart';
class Wrapper extends StatefulWidget {
  @override
  _WrapperState createState() => _WrapperState();
}

class _WrapperState extends State<Wrapper> {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<Userr>(context);

    return user!=null ? MainPage() : Authenticate();
  }
}
