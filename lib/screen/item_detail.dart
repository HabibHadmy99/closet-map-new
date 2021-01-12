import 'package:closet_map/List/list.dart';
import 'package:closet_map/nav_bar/CustomAppBar.dart';
import 'package:flutter/material.dart';

import 'cart.dart';

class ItemDetailScreen extends StatefulWidget {
  @override
  _ItemDetailScreen createState() => _ItemDetailScreen();
  static Route<dynamic> route() =>
      MaterialPageRoute(builder: (_) => ItemDetailScreen());
}

class _ItemDetailScreen extends State<ItemDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orangeAccent,
        title: new Center(child: new Text("Shop", textAlign: TextAlign.center)),
      ),
      backgroundColor: Colors.white,
      bottomNavigationBar: CustomAppBar(),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(0),
          child: Column(
            children: <Widget>[
              Container(
                  height: 1000,
                  child: Column(
                    children: <Widget>[
                      Container(
                        //image container
                        height: 400,
                        width: 500,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage(shirts[0]['image']),
                                fit: BoxFit.cover)),
                      ),
                      Container(
                          //dropdowns
                          child: Row(
                        children: <Widget>[
                          Container(
                            //dropdown1
                            margin: EdgeInsets.only(right: 0, left: 20),
                            height: 50,
                            width: 70,
                            child: VariationDropDown(
                              variation: color,
                              dropdownValue: color[0],
                              state: this,
                            ),
                          ),
                          Container(
                            //dropdown2
                            margin: EdgeInsets.only(right: 0, left: 20),
                            height: 50,
                            width: 70,
                            child: VariationDropDown(
                              variation: size,
                              dropdownValue: size[0],
                              state: this,
                            ),
                          )
                        ],
                      )),
                      Container(
                          //title & price
                          padding: EdgeInsets.all(10),
                          height: 50,
                          child: Row(
                            children: [
                              Container(
                                alignment: Alignment.centerLeft,
                                child: Text(shirts[0]['name'],
                                    style: TextStyle(
                                        fontSize: 25,
                                        fontWeight: FontWeight.bold)),
                              ),
                              Container(
                                  margin: EdgeInsets.only(left: 220),
                                  alignment: Alignment.centerRight,
                                  child: Text("100\$",
                                      style: TextStyle(
                                          fontSize: 25,
                                          fontWeight: FontWeight.bold)))
                            ],
                          )),
                      Container(
                        //description
                        padding: EdgeInsets.only(
                          left: 10,
                          right: 30,
                        ),
                        child: Text(
                            'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam viverra nulla a erat tempus auctor. Ut a luctus odio. Aenean elementum, justo vel scelerisque venenatis, mi libero interdum dui, vel ultricies eros diam sed velit.',
                            style: TextStyle(
                              fontSize: 15,
                              color: Colors.grey,
                            )),
                      ),
                      Container(
                        //add to cart
                        padding: EdgeInsets.only(left: 50, right: 50, top: 10,bottom: 10),
                        child: FlatButton(
                          child: Text(
                            'Add to Cart',
                            style: TextStyle(color: Colors.white),
                          ),
                          color: Colors.deepOrange,
                          shape: new RoundedRectangleBorder(
                              borderRadius: new BorderRadius.circular(30.0)),
                          onPressed: () {Navigator.pushReplacement(context, CartScreen.route());},
                        ),
                      ),
                      ShippingInfo()
                    ],
                  )),
            ],
          ),
        ),
      ),
    );
  }
}

class VariationDropDown extends StatefulWidget {
  final state;
  final variation;
  var dropdownValue;

  _VariationDropDown createState() => _VariationDropDown();
  @override
  VariationDropDown({Key key, this.variation, this.dropdownValue, this.state})
      : super(key: key);
}

class _VariationDropDown extends State<VariationDropDown> {
  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: widget.dropdownValue,
      icon: Icon(Icons.arrow_drop_down),
      iconSize: 24,
      elevation: 20,
      style: TextStyle(color: Colors.black38),
      onChanged: (String newValue) {
        setState(() {
          widget.dropdownValue = newValue;
        });
      },
      items: widget.variation.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }
}

class ShippingInfo extends StatefulWidget {
  @override
  _ShippingInfo createState() => _ShippingInfo();
}

class _ShippingInfo extends State<ShippingInfo> {

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      title: Text("Shipping Information", style: TextStyle(fontSize: 20),),
      trailing: Icon(Icons.arrow_drop_down),
      backgroundColor: Colors.white,
      children: [
        Column(
  
          children: [
            Container(
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.only(bottom: 15,left: 20),
              child: Text(
                "Description of shipping information",
                style: TextStyle(backgroundColor: Colors.white),
                
              ),
            ),
           
          ],
        )
      ],
    );
  }
}
