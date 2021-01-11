
import 'package:closet_map/nav_bar/CustomAppBar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../home.dart';


class AdminHomeScreen extends StatelessWidget {
  static Route<dynamic> route() =>
      MaterialPageRoute(builder: (_) => AdminHomeScreen());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CustomAppBar(),
      body: Column(
        children: <Widget>[HomeTopScreen(username: 'AdminUser',headerWords: 'Welcome, Admin',),
      /*  ListView(
          
          scrollDirection: Axis.vertical,
          children: <Widget>[
            Container(
              
            )
          ]
        )*/
          ],
        ),
    );
  }
}
/*, */
