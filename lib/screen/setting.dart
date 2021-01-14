import 'package:closet_map/nav_bar/CustomAppBar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MySetting extends StatefulWidget {
  static Route<dynamic> route() =>
      MaterialPageRoute(builder: (_) => MySetting());
  @override
  SettingPage createState() => SettingPage();
}

class SettingPage extends State<MySetting> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CustomAppBar(),
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
          padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0)),
                  margin: const EdgeInsets.fromLTRB(32.0, 30.0, 32.0, 16.0),
                  color: Colors.orangeAccent,
                  child: Column(
                    children: <Widget>[
                      ListTile(
                        contentPadding: EdgeInsets.fromLTRB(15, 7.5, 15, 7.5),
                        leading: Icon(Icons.lock_outlined, color: Colors.white),
                        title: Text("Change Password",
                            style: TextStyle(fontSize: 20)),
                        trailing: Icon(Icons.keyboard_arrow_right),
                        onTap: () {},
                      ),
                      buildContainer(),
                      ListTile(
                        contentPadding: EdgeInsets.fromLTRB(15, 7.5, 15, 7.5),
                        leading: Icon(Icons.location_on, color: Colors.white),
                        title: Text("Change Address",
                            style: TextStyle(fontSize: 20)),
                        trailing: Icon(Icons.keyboard_arrow_right),
                        onTap: () {},
                      ),
                    ],
                  )),
              const SizedBox(height: 10.0),
              Text("Mode Setting",
                  style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.black)),
              SwitchListTile(
                  activeColor: Colors.orangeAccent,
                  contentPadding: const EdgeInsets.all(0),
                  title: Text("Dark Mode", style: TextStyle(fontSize: 20)),
                  value: true,
                  onChanged: (value) {})
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
