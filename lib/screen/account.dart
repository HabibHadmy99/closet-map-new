import 'package:closet_map/nav_bar/CustomAppBar.dart';
import 'package:flutter/material.dart';

class AccountScreen extends StatelessWidget {
  static Route<dynamic> route() =>
      MaterialPageRoute(builder: (_) => AccountScreen());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orangeAccent,
      bottomNavigationBar: CustomAppBar(),
      body: Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                "Untuk Account Screen",
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
