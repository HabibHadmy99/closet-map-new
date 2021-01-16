import 'package:closet_map/List/user.dart';
import 'package:closet_map/Services/user_data_service.dart';
import 'package:closet_map/screen/account.dart';
import 'package:closet_map/screen/admin/admin_home.dart';
import 'package:closet_map/screen/cart.dart';
import 'package:closet_map/screen/home.dart';
import 'package:closet_map/screen/shop.dart';
import 'package:flutter/material.dart';

import '../dependencies.dart';

final UserDataService userDS = service();
const List<BottomNavigationBarItem> userNavBar = [
  BottomNavigationBarItem(
    icon: Icon(Icons.home),
    label: 'Home',
  ),
  BottomNavigationBarItem(
    icon: Icon(Icons.shop_two),
    label: 'Shop',
  ),
  BottomNavigationBarItem(
    icon: Icon(Icons.add_shopping_cart),
    label: 'Cart',
  ),
  BottomNavigationBarItem(
    icon: Icon(Icons.switch_account),
    label: 'Account',
  ),
];

List<BottomNavigationBarItem> adminNavBar = [
  BottomNavigationBarItem(
    icon: Icon(Icons.home),
    label: 'Home',
  ),
  BottomNavigationBarItem(
    icon: Icon(Icons.shop_two),
    label: 'Shop',
  ),
  BottomNavigationBarItem(
    icon: Icon(Icons.switch_account),
    label: 'Account',
  ),

];

class CustomAppBar extends StatelessWidget {
  final navtype;

  CustomAppBar({this.navtype = userNavBar});

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 15.0,
      child: BottomNavigationBar(
          backgroundColor: Colors.orangeAccent,
          type: BottomNavigationBarType.fixed,
          iconSize: 25,
          selectedFontSize: 15,
          unselectedFontSize: 10,
         items: navtype,
          
          selectedItemColor: Colors.deepOrangeAccent[400],
          onTap: (_onItemTapped) async {
            final User user = await userDS.getCurrentUser();
            if (_onItemTapped == 0) {
              if(user.type == 'user'){
                Navigator.pushReplacement(context, Home.route(user));
                }
              else if(user.type == 'admin'){
                Navigator.pushReplacement(context, AdminHomeScreen.route(user));
              }
            } else if (_onItemTapped == 1) {
              Navigator.pushReplacement(context, ShopScreen.route());
            } else if (_onItemTapped == 2 && (user.type == 'user')) {
              Navigator.pushReplacement(context, CartScreen.route());
            } else {
              Navigator.pushReplacement(context, Account.route(user));
            }
          }),
    );
  }
}
