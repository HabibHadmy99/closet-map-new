import 'package:flutter/material.dart';

import 'home.dart';
//import 'signup.dart';

class LoginScreen extends StatelessWidget {
  static Route<dynamic> route() =>
      MaterialPageRoute(builder: (_) => LoginScreen());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.orangeAccent,
      body: Container(
        child: Center(
          child: Column(
            children: <Widget>[
              SizedBox(height: 180),
              Row(
                children: <Widget>[
                  SizedBox(width: 40),
                  Text(
                    'Welcome back',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 40),
                  ),
                ],
              ),
              Row(
                children: <Widget>[
                  SizedBox(width: 50),
                  Text('Sign In With Your Account',
                      style: TextStyle(color: Colors.white, fontSize: 15)),
                  SizedBox(height: 10),
                ],
              ),
              SizedBox(height: 45),
              CustomTextField(hint: 'Email', secured: false),
              SizedBox(height: 10),
              CustomTextField(hint: 'Password', secured: true),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  GestureDetector(
                    onTap: () {},
                    child: Container(
                      child: Text('Forget Password?',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w700)),
                    ),
                  ),
                  SizedBox(width: 40),
                ],
              ),
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 70),
                child: ButtonTheme(
                    buttonColor: Colors.deepOrangeAccent,
                    minWidth: MediaQuery.of(context).size.width,
                    height: 55,
                    child: RaisedButton(
                      onPressed: () {
                        Navigator.pushReplacement(context, Home.route());
                      },
                      child: Text(
                        'Log in',
                        style: TextStyle(color: Colors.grey[800], fontSize: 22),
                      ),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25)),
                    )),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    "Don't Have an Accout ?",
                    style: TextStyle(color: Colors.white),
                  ),
                  SizedBox(
                    width: 10,
                    height: 50,
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: Text(
                      'Sign up',
                      style: TextStyle(
                          decoration: TextDecoration.underline,
                          fontWeight: FontWeight.w500,
                          color: Colors.white),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
class CustomTextField extends StatelessWidget {
  String hint;
  bool secured;
  CustomTextField({this.hint, this.secured});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 45, right: 45),
      child: TextField(
        obscureText: secured,
        cursorColor: Colors.white,
        decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(25),
              borderSide: BorderSide(color: Colors.transparent),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(25),
              borderSide: BorderSide(color: Colors.transparent),
            ),
            disabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(25),
              borderSide: BorderSide(color: Colors.transparent),
            ),
            hintText: hint,
            hintStyle: TextStyle(
                fontSize: 18,
                letterSpacing: 1.5,
                color: Colors.white70,
                fontWeight: FontWeight.w700),
            filled: true,
            fillColor: Colors.white.withOpacity(.3),
            focusColor: Colors.transparent),
      ),
    );
  }
}
