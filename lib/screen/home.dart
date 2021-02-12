import 'package:closet_map/List/list.dart';
import 'package:closet_map/List/user.dart';
import 'package:closet_map/Models/item_model.dart';
import 'package:closet_map/Services/items_dataservice.dart';
import 'package:closet_map/Services/items_service.dart';
import 'package:closet_map/screen/shop.dart';
import 'package:closet_map/screen/view.dart';

import 'package:flutter/cupertino.dart';
import 'package:closet_map/nav_bar/CustomAppBar.dart';
import 'package:closet_map/shape_clipper/Shape4HomeTop.dart';
import 'package:flutter/material.dart';
import '../dependencies.dart';
import 'account.dart';
import 'itemlist_viewmodel.dart';
import 'signin.dart';

List<String> setupOption = ['User Setting', 'Logout'];
User user;
List<Items> _items;

class Home extends StatelessWidget {
  static Route<dynamic> route(current) {
    user = current;
    return MaterialPageRoute(builder: (_) => Home());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: <Widget>[
        HomeTopScreen(
          username: '${user.name}',
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
                                  context, Account.route(user));
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
                "VIEW ALL(${_items.length})",
                style: viewAllStyle,
              )
            ],
          ),
        ),
        SingleChildScrollView(
            child: Container(
                height: 375.0,
                child: 
                View<ItemlistViewmodel>(
                      initViewmodel: (itemlistViewmodel)=> itemlistViewmodel.getList(),
                      builder: (context, itemlistViewmodel, __) {
                        final items = itemlistViewmodel.items;

                           if (items == null) {
                            return Center(
                              child: CircularProgressIndicator(),
                          );
                          }
                        itemlistViewmodel.getList();
                        
                        return ListView.builder(
                            scrollDirection: Axis.vertical,
                            itemCount: items.length,
                            itemBuilder: (context, index) {
                              final _item = items[index];
                              return Container(
                                child: MakeItem(
                                  brand: _item.brand,
                                  image: _item.image,
                                  context: context,
                                  names: _item.name,
                                  price: _item.price,
                                  index: index,
                                  items: items,
                                ),
                              );
                            });
                      })
                    
            )
            /*
        Container(
          height: 180.0,
          child: ListView(scrollDirection: Axis.horizontal, children: <Widget>[
            Padding(padding: const EdgeInsets.symmetric(horizontal: 4.0)),
            ClipRRect(
              borderRadius: BorderRadius.all(
                Radius.circular(10.0),
              ),
              child: Stack(children: <Widget>[
                Container(
                  height: 250.0,
                  width: 250.0,
                  child: Image.asset("assets/images/lasvegas.jpg",
                      fit: BoxFit.cover),
                ),
                Positioned(
                  left: 0.0,
                  bottom: 0.0,
                  width: 160.0,
                  height: 60.0,
                  child: Container(
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                            begin: Alignment.bottomCenter,
                            end: Alignment.topCenter,
                            colors: [
                          Colors.black,
                          Colors.black.withOpacity(0.1),
                        ])),
                  ),
                ),
                Positioned(
                  left: 10.0,
                  bottom: 10.0,
                  right: 10.0,
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            'Name',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                fontSize: 18.0),
                          ),
                          Text(
                            'Brand',
                            style: TextStyle(
                                fontWeight: FontWeight.normal,
                                color: Colors.white,
                                fontSize: 14.0),
                          ),
                        ],
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: 6.0, vertical: 2.0),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.rectangle,
                          borderRadius: BorderRadius.all(
                            Radius.circular(10.0),
                          ),
                        ),
                        child: Text(
                          'Harge',
                          style: TextStyle(fontSize: 20.0, color: Colors.black),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  height: 250.0,
                  width: 350.0,
                  child: Image.asset("assets/images/lasvegas.jpg",
                      fit: BoxFit.cover),
                ),
                Positioned(
                  left: 0.0,
                  bottom: 0.0,
                  width: 160.0,
                  height: 60.0,
                  child: Container(
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                            begin: Alignment.bottomCenter,
                            end: Alignment.topCenter,
                            colors: [
                          Colors.black,
                          Colors.black.withOpacity(0.1),
                        ])),
                  ),
                ),
                Positioned(
                  left: 10.0,
                  bottom: 10.0,
                  right: 10.0,
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            'Name',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                fontSize: 18.0),
                          ),
                          Text(
                            'Brand',
                            style: TextStyle(
                                fontWeight: FontWeight.normal,
                                color: Colors.white,
                                fontSize: 14.0),
                          ),
                        ],
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: 6.0, vertical: 2.0),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.rectangle,
                          borderRadius: BorderRadius.all(
                            Radius.circular(10.0),
                          ),
                        ),
                        child: Text(
                          'Harge',
                          style: TextStyle(fontSize: 20.0, color: Colors.black),
                        ),
                      ),
                    ],
                  ),
                )
              ]),
            ),
          ]),
        ),
      */
            )
      ],
    );
  }

  Widget _buildFetchingDataScreen() {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            CircularProgressIndicator(),
            SizedBox(height: 50),
            Text('Loading items...'),
          ],
        ),
      ),
    );
  }
}
