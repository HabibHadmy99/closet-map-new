import 'package:flutter/material.dart';

class AccountScreen extends StatelessWidget {
  static Route<dynamic> route() =>
      MaterialPageRoute(builder: (_) => AccountScreen());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orangeAccent,
      body: Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                "Untuk Account User Screen",
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
