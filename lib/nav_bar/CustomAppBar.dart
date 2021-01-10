import 'package:closet_map/screen/account.dart';
import 'package:closet_map/screen/cart.dart';
import 'package:closet_map/screen/home.dart';
import 'package:closet_map/screen/shop.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  Widget build(BuildContext context) {
    return Material(
      elevation: 15.0,
      child: BottomNavigationBar(
          backgroundColor: Colors.orangeAccent,
          type: BottomNavigationBarType.fixed,
          iconSize: 25,
          selectedFontSize: 15,
          unselectedFontSize: 10,
          items: [
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
          ],
          selectedItemColor: Colors.deepOrangeAccent[400],
          onTap: (index) {
            if (index == 0) {
              Navigator.pushReplacement(context, Home.route());
            } else if (index == 1) {
              Navigator.pushReplacement(context, ShopScreen.route());
            } else if (index == 2) {
              Navigator.pushReplacement(context, CartScreen.route());
            } else {
              Navigator.pushReplacement(context, Account.route());
            }
          }),
    );
  }
}
