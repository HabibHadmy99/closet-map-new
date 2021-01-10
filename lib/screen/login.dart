import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  static Route<dynamic> route() =>
      MaterialPageRoute(builder: (_) => LoginScreen());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orangeAccent,
      body: Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                "Untuk Login Screen",
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
