import 'package:closet_map/Services/user_data_service.dart';
import 'package:closet_map/nav_bar/CustomAppBar.dart';
import 'package:closet_map/screen/my_order.dart';
import 'package:closet_map/screen/profile.dart';
import 'package:closet_map/screen/setting.dart';
import 'package:closet_map/shape_clipper/profile_clipper.dart';
import 'package:flutter/material.dart';

import '../dependencies.dart';

class Account extends StatefulWidget {
  static Route<dynamic> route(current) {
    user = current;
    return MaterialPageRoute(builder: (_) => Account());
  }

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Account> {
  final UserDataService userDS = service();
  List<BottomNavigationBarItem> navBar() {
    List<BottomNavigationBarItem> currentNav;
    if (userDS.getCurrentUsertype() == 'user') {
      currentNav = userNavBar;
    } else if (userDS.getCurrentUsertype() == 'admin') {
      currentNav = adminNavBar;
    }
    return currentNav;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Colors.indigo[900],
      bottomNavigationBar: CustomAppBar(navtype: navBar()),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              height: 250.0,
              child: Stack(
                children: <Widget>[
                  Container(),
                  ClipPath(
                      clipper: MyCustomClipper(),
                      child: Container(
                        height: 300.0,
                        decoration: BoxDecoration(
                          color: Colors.orangeAccent, // Colors.blueGrey[800],
                        ),
                      )),
                  Align(
                    alignment: Alignment(0, 2.15),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        CircleAvatar(
                          backgroundImage:
                              AssetImage("assets/images/profile.png"),
                          radius: 60.0,
                        ),
                        SizedBox(height: 20),
                        Text(
                          '${user.name}',
                          style: TextStyle(
                            fontSize: 21.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SafeArea(
                            child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[],
                        ))
                      ],
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 90,
            ),
            ProfileItem(
                item: "My Profile",
                press: () {
                  Navigator.pushReplacement(context, MyProfile.route(user));
                }),
            ProfileItem(
                item: "My Order",
                press: () {
                  Navigator.pushReplacement(context, Order.route());
                }),
            ProfileItem(
                item: "Setting",
                press: () {
                  Navigator.pushReplacement(context, MySetting.route());
                }),
          ],
        ),
      ),
    );
  }
}

class ProfileItem extends StatelessWidget {
  const ProfileItem({
    Key key,
    @required this.item,
    this.press,
  }) : super(key: key);

  final String item;
  final VoidCallback press;

  //final String icon;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
      child: FlatButton(
        padding: EdgeInsets.all(25),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        color: Colors.orangeAccent, //Colors.blueGrey[600],
        onPressed: press,
        child: Row(
          children: [
            SizedBox(width: 20),
            Expanded(
                child: Text(
              item,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
            )),
            Icon(Icons.arrow_forward_ios),
          ],
        ),
      ),
    );
  }
}
