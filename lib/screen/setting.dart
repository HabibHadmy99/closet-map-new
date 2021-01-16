import 'package:closet_map/Services/user_data_service.dart';
import 'package:closet_map/nav_bar/CustomAppBar.dart';
import 'package:flutter/material.dart';

import '../dependencies.dart';

class MySetting extends StatefulWidget {
  static Route<dynamic> route() =>
      MaterialPageRoute(builder: (_) => MySetting());
  @override
  SettingPage createState() => SettingPage();
}

class SettingPage extends State<MySetting> {
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

  int index = 0;
  String valueChoose;
  String mode = 'Orange Theme';
  //List listTheme = ["Blue Theme", "Red Theme"];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CustomAppBar(navtype: navBar()),
      appBar: AppBar(
        backgroundColor:
            index == 0 ? Colors.orangeAccent : Colors.deepOrangeAccent,
        title: Text(
          'Settings',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 25,
            color: Colors.white,
          ),
        ),
      ),
      body: SingleChildScrollView(
          padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const SizedBox(height: 10.0),
              Text("Mode Setting",
                  style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.black)),
              RadioListTile(
                groupValue: index,
                title: Text('Orange Theme'),
                value: 0,
                onChanged: (value) async {
                  //ColorIndex(0);
                  setState(() {
                    index = value;
                  });
                },
              ),
              RadioListTile(
                groupValue: index,
                title: Text('Red Theme'),
                value: 1,
                onChanged: (value) async {
                  //ColorIndex(1);
                  setState(() {
                    index = value;
                  });
                },
              ),
            ],
          )),
    );
  }

  Container buildContainer() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 8.0),
      width: double.infinity,
      height: 1.0,
      color: Colors.green.shade400,
    );
  }
}
