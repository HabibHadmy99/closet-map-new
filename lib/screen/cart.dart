import 'package:closet_map/List/list.dart';
import 'package:closet_map/nav_bar/CustomAppBar.dart';
import 'package:flutter/material.dart';

class CartScreen extends StatelessWidget {
  static Route<dynamic> route() =>
      MaterialPageRoute(builder: (_) => CartScreen());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.orangeAccent,
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
      body: Container(
        //height: 400,
        child: ListView.builder(
          scrollDirection: Axis.vertical,
          itemCount: buyshirts.length,
          itemBuilder: (context, index) {
            return Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(
                    height: 50,
                    width: 50,
                  ),
                  Container(
                    child: Row(children: [
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 16),
                        width: 150,
                        height: 150,
                        decoration: BoxDecoration(
                          color: Colors.red[100],
                          image: new DecorationImage(
                              image: new AssetImage(buyshirts[index]['image'])),
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      Column(children: [
                        Container(
                          height: 50,
                          padding: EdgeInsets.only(left: 10),
                          child: Text(
                            buyshirts[index]['name'],
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
                        ),
                        Container(
                          height: 50,
                          padding: EdgeInsets.only(left: 10),
                          child: Text(
                            buyshirts[index]['brand'],
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
                        ),
                        Container(
                          //height: 120,
                          padding: EdgeInsets.only(left: 10),
                          child: Text(
                            buyshirts[index]['price'],
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
                        ),
                      ]),
                    ]),
                  ),
                  /* Container(
                    padding: EdgeInsets.only(right: 30),
                    width: 35,
                    height: 35,
                    decoration: BoxDecoration(
                      color: Colors.red[400],
                      image: new DecorationImage(
                          image: new AssetImage("assets/images/61848.png")),
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),*/
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
