import 'package:flutter/material.dart';
import 'package:flutter_app/services/auth.dart';

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  TextEditingController _emailField = TextEditingController();
  TextEditingController _passwordField = TextEditingController();
  @override
  final AuthService _auth= AuthService();

  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
            color: Colors.white,
          ),

          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

              Row(
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width/8,
                  ),
                  Expanded(
                    child: TextFormField(

                      controller: _emailField,
                      decoration: InputDecoration(
                          hintText: "xyz@email.com",
                          hintStyle: TextStyle(
                            fontSize: 22.0,
                            color: Colors.grey,
                          ),
                          labelText: "Email",
                          labelStyle: TextStyle(
                            fontSize: 25.0,
                            color: Colors.black,
                          )
                      ),
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width/8,
                  ),
                ],
              ),

              Row(
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width/8,
                  ),
                  Expanded(
                    child: TextFormField(
                      controller: _passwordField,
                      obscureText: true,
                      decoration: InputDecoration(
                          hintText: "password",
                          hintStyle: TextStyle(
                            fontSize: 22.0,
                            color: Colors.grey,
                          ),
                          labelText: "Password",
                          labelStyle: TextStyle(
                            fontSize: 25.0,
                            color: Colors.black,
                          )
                      ),
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width/8,
                  ),
                ],
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height/8,
              ),
              Container(
                width: MediaQuery.of(context).size.width / 1.4,
                height: 45,
                decoration:
                BoxDecoration(
                  borderRadius: BorderRadius.circular(15.0),
                  color: Colors.green,

                ),
                child: MaterialButton(
                    onPressed: () async {
                      dynamic result = await _auth.signUp(_emailField.text, _passwordField.text);

                    },
                    child: Text("Sign Up")
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height/20,
              ),
              Container(
                width: MediaQuery.of(context).size.width / 1.4,
                height: 45,
                decoration:
                BoxDecoration(
                  borderRadius: BorderRadius.circular(15.0),
                  color: Colors.green,

                ),
                child: MaterialButton(
                    onPressed: () async {
                      dynamic result = await _auth.signIn(_emailField.text, _passwordField.text);

                    },
                    child: Text("Login")
                ),
              )
            ],
          ),
        )
    );
  }
}

