import 'package:closet_map/List/list.dart';
import 'package:closet_map/nav_bar/CustomAppBar.dart';
import 'package:flutter/material.dart';

import 'item_detail.dart';

class ShopScreen extends StatelessWidget {
  static Route<dynamic> route() =>
      MaterialPageRoute(builder: (_) => ShopScreen());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orangeAccent,
        title: new Center(child: new Text("SHOP", textAlign: TextAlign.center)),
      ),
      backgroundColor: Colors.white,
      bottomNavigationBar: CustomAppBar(),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(20),
          child: Column(
            children: <Widget>[
              Container(
                height: 40,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    Categories(category: 'All',),
                    Categories(category: 'Mens',),
                    Categories(category: 'Womens',),
                    Categories(category: 'Kids',),
                    Categories(category: 'Shoes',),
                  ],

                ),
              ),
              SizedBox(
                height: 20,
              ),
           SizedBox(
             height: 600.0,
              
          child: ListView.builder(
          
          scrollDirection: Axis.vertical,
          itemCount: shirts.length,
                    itemBuilder: (context, index) {
                      return Container(
                        child: MakeItem(
                          brand: shirts[index]['brand'],
                          image: shirts[index]['image'],
                          context: context,
                          names: shirts[index]['name'],
                          ),
                      );
                    }
          
        )
      
            ) 
            ],
          ),
        ),
      ),
    );
  }
}

class Categories extends StatelessWidget {
  Categories({this.category});
  final category;
  @override
  Widget build(BuildContext context) {
    return AspectRatio(
        aspectRatio: 2.2 / 1,
        child: Container(
          margin: EdgeInsets.only(right: 10),
          child: Center(
            child: Text(
              category,
              style: TextStyle(fontSize: 17),
            ),
          ),
        ));
  }
}

class MakeItem extends StatelessWidget {
  const MakeItem({
    Key key,
    @required this.names,
    @required this.image,
    @required this.brand,
    @required this.context,
  }) : super(key: key);

  final names;
  final image;
  final brand;
  final context;

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: brand,
      child: GestureDetector(
        onTap: () {
          Navigator.pushReplacement(context, ItemDetailScreen.route());
        },
        child: Container(
          height: 250,
          width: double.infinity,
          padding: EdgeInsets.all(20),
          margin: EdgeInsets.only(bottom: 20),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              image:
                  DecorationImage(image: AssetImage(image), fit: BoxFit.cover),
              boxShadow: [
                BoxShadow(
                    color: Colors.grey[400],
                    blurRadius: 10,
                    offset: Offset(0, 10))
              ]),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          names,
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 30,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          brand,
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: 35,
                    height: 35,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle, color: Colors.white),
                    child: Center(
                      child: Icon(
                        Icons.favorite_border,
                        size: 20,
                      ),
                    ),
                  )
                ],
              ),
              Text(
                "100\$",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
