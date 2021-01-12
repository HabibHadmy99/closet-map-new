import 'package:closet_map/List/list.dart';
import 'package:closet_map/nav_bar/CustomAppBar.dart';
import 'package:flutter/material.dart';

import 'body_cart.dart';

class CartScreen extends StatelessWidget {
  static String routeName = "/cart";
  static Route<dynamic> route() =>
      MaterialPageRoute(builder: (_) => CartScreen());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CartScreen2(),
    );
  }
}
