import 'package:closet_map/List/user.dart';
import 'package:closet_map/Models/mock_user.dart';
import 'package:closet_map/nav_bar/CustomAppBar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../dependencies.dart';

class MyProfile extends StatefulWidget {
  static Route<dynamic> route() =>
      MaterialPageRoute(builder: (_) => MyProfile());
  @override
  _UserState createState() => _UserState();
}

class _UserState extends State<MyProfile> {
  List<User> user;
  bool _passwordVisible = true;

  @override
  Widget build(BuildContext context) {
    final UserDataServiceMock userDataService = service();

    return FutureBuilder<List<User>>(
        future: userDataService.getUserList(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            user = snapshot.data;
            return _buildMainScreen();
          }
          return _buildFetchingDataScreen();
        });
  }

  Scaffold _buildMainScreen() {
    return Scaffold(
      bottomNavigationBar: CustomAppBar(),
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
                        SizedBox(height: 4.0),
                        Text(
                          "Habib Hadmy",
                          style: TextStyle(
                            fontSize: 21.0,
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
                cursorColor: Theme.of(context).cursorColor,
                initialValue: 'Habib Hadmy Bin Zulkafli',
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
                cursorColor: Theme.of(context).cursorColor,
                maxLength: 20,
                obscureText: _passwordVisible,
                initialValue: 'Habibun99',
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
                cursorColor: Theme.of(context).cursorColor,
                initialValue: 'HabibHadmy99@gmail.com',
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
                cursorColor: Theme.of(context).cursorColor,
                initialValue: '01234567891',
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
                cursorColor: Theme.of(context).cursorColor,
                initialValue:
                    'Jalan Sultan Salahuddin, Kuala Lumpur, 50480 Kuala Lumpur Wilayah Persekutuan Kuala Lumpur',
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
            Text('Fetching todo... Please wait'),
          ],
        ),
      ),
    );
  }
}
