import 'dart:developer';

import 'package:closet_map/List/user.dart';
import 'package:closet_map/Models/mock_user.dart';
import 'package:closet_map/Services/user_data_service.dart';
import 'package:closet_map/nav_bar/CustomAppBar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../dependencies.dart';

User user;

class MyProfile extends StatefulWidget {
  static Route<dynamic> route(current) {
    user = current;
    return MaterialPageRoute(builder: (_) => MyProfile());
  }

  @override
  _UserState createState() => _UserState();
}

class _UserState extends State<MyProfile> {
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

  //User user;
  bool _passwordVisible = true;

  @override
  Widget build(BuildContext context) {
    final UserDataService userDataService = service();

    return FutureBuilder<User>(
        future: userDataService.getCurrentUser(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            user = snapshot.data;
            return _buildMainScreen();
          }
          return _buildFetchingDataScreen();
        });
  }

  Scaffold _buildMainScreen() {
    String name;
    String email;
    String contact;
    String address;
    String password;
    //final ModeNotifier = Provider.of<ValueNotifier<bool>>(context);

    return Scaffold(
      bottomNavigationBar: CustomAppBar(
        navtype: navBar(),
      ),
      appBar: AppBar(
        title: Text(
          'My Profile',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 25,
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.orangeAccent,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              height: 150.0,
              child: Stack(
                children: <Widget>[
                  Container(),
                  ClipPath(
                      child: Container(
                    height: 70.0,
                    decoration: BoxDecoration(
                      color: Colors.orangeAccent,
                    ),
                  )),
                  Align(
                    alignment: Alignment(0, 2.25),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        CircleAvatar(
                          backgroundImage:
                              AssetImage("assets/images/profile.png"),
                          radius: 60.0,
                        ),
                        SizedBox(height: 10.0),
                        Text(
                          user.name,
                          style: TextStyle(
                            fontSize: 15.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            Padding(padding: EdgeInsets.fromLTRB(30, 30, 0, 0)),
            Container(
              height: 80,
              width: 350,
              child: TextFormField(
                initialValue: user.name,
                onChanged: (value) => name = value,
                cursorColor: Theme.of(context).cursorColor,
                maxLength: 30,
                decoration: InputDecoration(
                  labelText: 'Full Name',
                  labelStyle: TextStyle(
                      color: Colors.orangeAccent,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                ),
              ),
            ),
            Container(
              height: 80,
              width: 350,
              child: TextFormField(
                onChanged: (value) => password = value,
                cursorColor: Theme.of(context).cursorColor,
                maxLength: 20,
                obscureText: _passwordVisible,
                initialValue: user.password,
                decoration: InputDecoration(
                  labelText: 'Password',
                  suffixIcon: IconButton(
                      icon: Icon(
                        _passwordVisible
                            ? Icons.visibility
                            : Icons.visibility_off,
                        //color: Theme.of(context).primaryColorDark,
                      ),
                      onPressed: () {
                        setState(() {
                          _passwordVisible = !_passwordVisible;
                        });
                      }),
                  labelStyle: TextStyle(
                      color: Colors.orangeAccent,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                ),
              ),
            ),
            Container(
              height: 80,
              width: 350,
              child: TextFormField(
                onChanged: (value) => email = value,
                cursorColor: Theme.of(context).cursorColor,
                initialValue: user.email,
                maxLength: 30,
                decoration: InputDecoration(
                  labelText: 'Email',
                  labelStyle: TextStyle(
                      color: Colors.orangeAccent,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                ),
              ),
            ),
            Container(
              height: 80,
              width: 350,
              child: TextFormField(
                onChanged: (value) => user.contact,
                cursorColor: Theme.of(context).cursorColor,
                initialValue: user.contact,
                maxLength: 110,
                decoration: InputDecoration(
                  labelText: 'Contact',
                  labelStyle: TextStyle(
                      color: Colors.orangeAccent,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                ),
              ),
            ),
            Container(
              height: 80,
              width: 350,
              child: TextFormField(
                onChanged: (value) => address = value,
                cursorColor: Theme.of(context).cursorColor,
                initialValue: user.address,
                maxLength: 190,
                decoration: InputDecoration(
                  labelText: 'Shipping Address',
                  labelStyle: TextStyle(
                      color: Colors.orangeAccent,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                ),
              ),
            ),
            FlatButton(
              color: Colors.orangeAccent,
              onPressed: () async {
                UserDataService userDataService = service();
                final curruser = await userDataService.updateUser(
                    name: name,
                    email: email,
                    contact: contact,
                    address: address,
                    password: password,
                    id: user.id);
                userDataService.setCurrentUser(curr: curruser);
                Navigator.pushReplacement(context, MyProfile.route(user));
              },
              child: Text('Save'),
            )
          ],
        ),
      ),
    );
  }

  Scaffold _buildFetchingDataScreen() {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            CircularProgressIndicator(),
            SizedBox(height: 50),
            Text('Fetching data... Please wait'),
          ],
        ),
      ),
    );
  }
}
