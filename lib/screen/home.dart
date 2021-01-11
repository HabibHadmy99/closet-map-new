import 'package:closet_map/nav_bar/CustomAppBar.dart';
import 'package:closet_map/shape_clipper/Shape4HomeTop.dart';
import 'package:flutter/material.dart';
import 'account.dart';
import 'login.dart';

List<String> setupOption = ['User Setting', 'Logout'];

class Home extends StatelessWidget {
  static Route<dynamic> route() => MaterialPageRoute(builder: (_) => Home());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: <Widget>[HomeTopScreen(username: 'Habib Hadmy',headerWords: 'Let\'s Start \nShopping !!',)]),
      bottomNavigationBar: CustomAppBar(),
    );
  }
}

class HomeTopScreen extends StatefulWidget {
  final headerWords;
  final username;

  HomeTopScreen({this.username,this.headerWords});
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
                        widget.username,
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                      Spacer(),
                      PopupMenuButton(
                        child: Row(
                          children: <Widget>[
                            Icon(Icons.settings, color: Colors.white, size: 30),
                          ],
                        ),
                        itemBuilder: (BuildContext context) =>
                            <PopupMenuItem<int>>[
                          PopupMenuItem(
                            child: Row(
                              children: <Widget>[
                                Icon(Icons.switch_account),
                                Text(setupOption[0]),
                              ],
                            ),
                            value: 0,
                          ),
                          PopupMenuItem(
                            child: Row(
                              children: <Widget>[
                                Icon(Icons.logout),
                                Text(setupOption[1]),
                              ],
                            ),
                            value: 1,
                          ),
                        ],
                        onSelected: (value) {
                          if (value == 0) {
                            Navigator.pushReplacement(context, Account.route());
                          } else {
                            Navigator.pushReplacement(
                                context, LoginScreen.route());
                          } //Logout
                        },
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10.0,
                ),
                Text(
                  widget.headerWords,
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
