import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  final List<BottomNavigationBarItem> bottomBarItems = [];

  CustomAppBar() {
    bottomBarItems.add(
      BottomNavigationBarItem(
        icon: Icon(
          Icons.home,
        ),
        label: "Home",
      ),
    );

    bottomBarItems.add(
      new BottomNavigationBarItem(
        icon: new Icon(
          Icons.shop,
        ),
        label: "Shop",
      ),
    );

    bottomBarItems.add(
      new BottomNavigationBarItem(
        icon: new Icon(
          Icons.shopping_cart,
        ),
        label: "Cart",
      ),
    );

    bottomBarItems.add(
      new BottomNavigationBarItem(
        icon: new Icon(
          Icons.switch_account,
        ),
        label: "Account",
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 15.0,
      child: BottomNavigationBar(
        unselectedItemColor: Colors.black,
        selectedItemColor: Colors.orangeAccent,
        items: bottomBarItems,
        type: BottomNavigationBarType.fixed,
      ),
    );
  }
}
