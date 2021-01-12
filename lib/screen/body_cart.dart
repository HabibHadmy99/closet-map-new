import 'package:closet_map/List/list.dart';
import 'package:closet_map/nav_bar/CustomAppBar.dart';
import 'package:closet_map/screen/Checkout.dart';
import 'package:flutter/material.dart';

import 'body_cart.dart';

class CartScreen2 extends StatelessWidget {
  static String routeName = "/cart";
  static Route<dynamic> route() =>
      MaterialPageRoute(builder: (_) => CartScreen2());

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
              "Your Cart",
              style: TextStyle(color: Colors.black),
            ),
            Text(
              "${buyshirts.length} items",
              style: Theme.of(context).textTheme.caption,
            ),
          ],
        ),
      ),
      bottomNavigationBar: CustomAppBar(),
      backgroundColor: Colors.white,
      body: ListView.separated(
          scrollDirection: Axis.vertical,
          itemCount: buyshirts.length,
          itemBuilder: (context, index) {
            return Column(
              children: [
                Row(
                  children: [
                    SizedBox(
                      width: 88,
                      child: AspectRatio(
                        aspectRatio: 1,
                        child: Container(
                          decoration: BoxDecoration(
                            color: Color(0xFFFFE6E6),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Image.asset(buyshirts[index]['image']),
                        ),
                      ),
                    ),
                    SizedBox(width: 20),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          buyshirts[0]['name'] + buyshirts[index]['name'],
                          style: TextStyle(fontSize: 16, color: Colors.black),
                          maxLines: 2,
                        ),
                        Text.rich(
                          TextSpan(
                            text: "\$${buyshirts[index]['price']}",
                            style: TextStyle(
                                fontWeight: FontWeight.w600,
                                color: Colors.orange),
                          ),
                        ),
                      ],
                    ),
                    Spacer(),
                    Column(
                      children: [
                        SizedBox(
                          width: 30,
                          child: AspectRatio(
                            aspectRatio: 1,
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.red[300],
                                image: new DecorationImage(
                                    image: new AssetImage(
                                        "assets/images/61848.png")),
                                borderRadius: BorderRadius.circular(5),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            );
          },
          separatorBuilder: (context, index) => Divider(
                color: Colors.orangeAccent,
              )),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          FloatingActionButton.extended(
            heroTag: null,
            onPressed: () =>
                Navigator.pushReplacement(context, Checkout.route()),
            label: Text('Checkout'),
            icon: Icon(Icons.login_rounded),
          ),
        ],
      ),
    );
  }
}
