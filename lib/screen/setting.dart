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
  String valueChoose;
  List listTheme = ["Blue Theme", "Red Theme"];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CustomAppBar(navtype: navBar()),
      appBar: AppBar(
        backgroundColor: Colors.orangeAccent,
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
          padding: EdgeInsets.fromLTRB(35, 0, 15, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const SizedBox(height: 10.0),
              Text("Mode Setting",
                  style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.black)),
              SizedBox(height: 15),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Container(
                  padding: EdgeInsets.only(left: 16, right: 16),
                  decoration: BoxDecoration(
                      border: Border.all(width: 1),
                      borderRadius: BorderRadius.circular(15)),
                  child: DropdownButton(
                    dropdownColor: Colors.orange[200],
                    icon: Icon(Icons.arrow_drop_down),
                    iconSize: 36,
                    isExpanded: true,
                    underline: SizedBox(),
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                    ),
                    hint: Text("Select Color"),
                    value: valueChoose,
                    onChanged: (newValue) {
                      setState(() {
                        valueChoose = newValue;
                      });
                    },
                    items: listTheme.map((valueItem) {
                      return DropdownMenuItem(
                        value: valueItem,
                        child: Text(valueItem),
                      );
                    }).toList(),
                  ),
                ),
              )
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
