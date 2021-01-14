import 'package:closet_map/List/list.dart';
import 'package:flutter/material.dart';

class Checkout extends StatelessWidget {
  static String routeName = "/cart";
  static Route<dynamic> route() =>
      MaterialPageRoute(builder: (_) => Checkout());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.1,
        centerTitle: true,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          color: Colors.black,
          onPressed: () {
            //Navigator.pop(context);
          },
        ),
        title: Column(
          children: [
            Text(
              "Checkout",
              style: TextStyle(color: Colors.black),
            ),
            Text(
              "${buyshirts.length} items",
              style: Theme.of(context).textTheme.caption,
            ),
          ],
        ),
      ),
    );
  }
}
