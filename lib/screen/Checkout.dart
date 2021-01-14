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
            //add route
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
      body: Stack(
        children: [
          //buildtitle(),
          buildPayment(),
        ],
      ),
    );
  }

  buildtitle() {
    return Container(
        child: Text(
      'Payment Method',
      textAlign: TextAlign.center,
      overflow: TextOverflow.ellipsis,
      style: TextStyle(fontWeight: FontWeight.bold),
    ));
  }

  buildPayment() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20.0),
      width: 500,
      height: 200.0,
      child: Column(
        children: [
          SizedBox(
            height: 20,
          ),
          Text(
            'Payment Method',
            textAlign: TextAlign.center,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 6.0),
            width: 500,
            height: 100.0,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: <Widget>[
                Container(
                  child: Container(
                    width: 150,
                    height: 100,
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                ),
                SizedBox(width: 20),
                Container(
                  child: Container(
                    width: 150,
                    height: 100,
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                ),
                SizedBox(width: 20),
                Container(
                  child: Container(
                    width: 150,
                    height: 100,
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                ),
                SizedBox(width: 20),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
