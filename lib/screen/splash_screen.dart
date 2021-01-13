import 'dart:async';
import 'package:flutter/material.dart';
import 'login.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  void initState() {
    super.initState();
    Timer(
        Duration(seconds: 3),
        () => Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (context) => MaterialApp(
                      home: LoginScreen(),
                      debugShowCheckedModeBanner: false,
                    ))));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orangeAccent,
      body: Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.asset('assets/images/logo.png'),
              Text(
                "CLOSET",
                style: TextStyle(
                    fontSize: 32.0,
                    color: Colors.white,
                    fontFamily: 'Oxygen',
                    fontWeight: FontWeight.bold),
              ),
            ]),
      ),
    );
  }
}
