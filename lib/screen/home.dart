import 'package:closet_map/nav_bar/CustomAppBar.dart';
import 'package:closet_map/shape_clipper/Shape4HomeTop.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Colors.redAccent,
      bottomNavigationBar: CustomAppBar(),
      body: Column(
        children: <Widget>[HomeTopScreen()],
      ),
    );
  }
}

class HomeTopScreen extends StatefulWidget {
  @override
  _HomeTopScreenState createState() => _HomeTopScreenState();
}

class _HomeTopScreenState extends State<HomeTopScreen> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        ClipPath(
          clipper: Shape4HomeTop(),
          child: Container(
            height: 250.0,
            color: Colors.orangeAccent,
            child: Column(
              children: <Widget>[
                SizedBox(height: 10.0),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    children: <Widget>[
                      Icon(Icons.account_circle_rounded,
                          color: Colors.white, size: 40),
                      Text(
                        "Habib Hadmy",
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                      Spacer(),
                      Icon(Icons.settings, color: Colors.white, size: 30),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10.0,
                ),
                Text(
                  'Lets Start\nShopping !!',
                  style: TextStyle(
                      fontSize: 35.0,
                      color: Colors.white,
                      fontFamily: 'Oxygen',
                      fontWeight: FontWeight.bold),
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}

var homeButtomScreen = Column(
  children: <Widget>[
    Text(
      "Recent Store",
      style: TextStyle(
        fontSize: 120.0,
        fontFamily: 'Oxygen',
        color: Colors.black,
      ),
    )
  ],
);
