import 'package:closet_map/List/list.dart';
import 'package:closet_map/Models/item_model.dart';
import 'package:closet_map/Services/items_service.dart';

import 'package:flutter/cupertino.dart';
import 'package:closet_map/nav_bar/CustomAppBar.dart';
import 'package:closet_map/shape_clipper/Shape4HomeTop.dart';
import 'package:flutter/material.dart';
import 'account.dart';
import 'signin.dart';

List<String> setupOption = ['User Setting', 'Logout'];

class Home extends StatelessWidget {
  static Route<dynamic> route() => MaterialPageRoute(builder: (_) => Home());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: <Widget>[
        HomeTopScreen(
          username: 'Habib Hadmy',
          headerWords: 'Let\'s Start \nShopping !!',
        ),
        HomeBottomScreen()
      ]),
      bottomNavigationBar: CustomAppBar(),
    );
  }
}

const TextStyle dropDownLabelStyle =
    TextStyle(color: Colors.white, fontSize: 16.0);
const TextStyle dropDownMenuItemStyle =
    TextStyle(color: Colors.black, fontSize: 16.0);

class HomeTopScreen extends StatefulWidget {
  final headerWords;
  final username;

  HomeTopScreen({this.username, this.headerWords});
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
                              Icon(Icons.settings,
                                  color: Colors.white, size: 30),
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
                              Navigator.pushReplacement(
                                  context, Account.route());
                            } else {
                              Navigator.pushReplacement(
                                  context, SigninScreen.route());
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
              )),
        ),
      ],
    );
  }
}

var viewAllStyle = TextStyle(fontSize: 14.0, color: Colors.red);

class HomeBottomScreen extends StatefulWidget {
  @override
  HomeBottomScreenState createState() {
    return new HomeBottomScreenState();
  }
}

class HomeBottomScreenState extends State<HomeBottomScreen> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                "Currently Watched Items",
                style: dropDownMenuItemStyle,
              ),
              Spacer(),
              Text(
                "VIEW ALL(${null})",
                style: viewAllStyle,
              )
            ],
          ),
        ),
        Container(
          height: 250.0,
          child: ListView(scrollDirection: Axis.horizontal, children: <Widget>[
            Container(
              height: 210.0,
              width: 100.0,
              //color: Colors.amberAccent,
            ),
            Container(height: 210.0, width: 100.0),
            Container(height: 210.0, width: 100.0),
            Container(height: 210.0, width: 100.0),
            Container(height: 210.0, width: 100.0)
          ]),
        ),
      ],
    );

    //class productView
  }
}
