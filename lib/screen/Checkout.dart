import 'package:flutter/material.dart';

class Checkout extends StatelessWidget {
  static String routeName = "/cart";
  static Route<dynamic> route() =>
      MaterialPageRoute(builder: (_) => Checkout());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
    );
  }
}
