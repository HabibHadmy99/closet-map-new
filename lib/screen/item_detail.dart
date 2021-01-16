import 'package:closet_map/List/list.dart';
import 'package:closet_map/Models/item_model.dart';
import 'package:closet_map/Services/OrderService/order_data_service_mock.dart';
import 'package:closet_map/Services/user_data_service.dart';
import 'package:closet_map/nav_bar/CustomAppBar.dart';
import 'package:flutter/material.dart';

import '../dependencies.dart';
import 'cart.dart';

//pass index
class ItemDetailScreen extends StatefulWidget {
  final Items itemsList;
  @override
  ItemDetailScreen({this.itemsList});
  _ItemDetailScreen createState() => _ItemDetailScreen();
}

class _ItemDetailScreen extends State<ItemDetailScreen> {
  final UserDataService userDS = service();
List<BottomNavigationBarItem> navBar() {
    List<BottomNavigationBarItem> currentNav;
    if (userDS.getCurrentUsertype() == 'user') {
      currentNav = userNavBar;
    } else if (userDS.getCurrentUsertype() == 'admin') {
      currentNav = adminNavBar;
    }
    return currentNav;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orangeAccent,
        title: new Center(child: new Text("Shop", textAlign: TextAlign.center)),
      ),
      backgroundColor: Colors.white,
      bottomNavigationBar: CustomAppBar(navtype: navBar(),),
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
                                image: AssetImage(widget.itemsList.image),
                                fit: BoxFit.cover)),
                      ),
                      Container(
                          //dropdowns
                          child: Row(
                        children: <Widget>[
                          //dropdown1
                          VariationDropDown(
                            variation: color,
                            dropdownValue: color[0],
                            state: this,
                          ),
                          //dropdown2
                          VariationDropDown(
                            variation: size,
                            dropdownValue: size[0],
                            state: this,
                          ),
                        ],
                      )),
                      Container(
                          //title,brand & price
                          padding:
                              EdgeInsets.only(left: 10, bottom: 0, right: 10),
                          height: 50,
                          child: Row(
                            children: [
                              Expanded(
                                child: Container(
                                  alignment: Alignment.centerLeft,
                                  child: Text(widget.itemsList.name,
                                      style: TextStyle(
                                          fontSize: 25,
                                          fontWeight: FontWeight.bold)),
                                ),
                              ),
                              Container(
                                  margin: EdgeInsets.only(left: 100),
                                  alignment: Alignment.centerRight,
                                  child: Text(
                                      widget.itemsList.price.toString() + "\$",
                                      style: TextStyle(
                                          fontSize: 25,
                                          fontWeight: FontWeight.bold))),
                            ],
                          )),
                      Container(
                          margin: EdgeInsets.only(left: 10, bottom: 15),
                          alignment: Alignment.centerLeft,
                          child: Text(widget.itemsList.brand,
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black54))),
                      Container(
                        //description
                        alignment: Alignment.centerLeft,
                        padding:
                            EdgeInsets.only(left: 10, right: 30, bottom: 60),
                        child: Text(widget.itemsList.desc,
                            style: TextStyle(
                              fontSize: 15,
                              color: Colors.grey,
                            )),
                      ),
                      Container(
                        //add to cart
                        padding: EdgeInsets.only(
                            left: 50, right: 50, top: 10, bottom: 10),
                        child: FlatButton(
                          child: Text(
                            'Add to Cart',
                            style: TextStyle(color: Colors.white),
                          ),
                          color: Colors.deepOrange,
                          shape: new RoundedRectangleBorder(
                              borderRadius: new BorderRadius.circular(30.0)),
                          onPressed: () {
                            final OrderDataServiceMock orderDataService =
                                service();

                            orderDataService.updateCartlist(
                                items: widget.itemsList);

                            Navigator.pushReplacement(
                                context, CartScreen.route());
                          },
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
    return Container(
      margin: EdgeInsets.only(right: 0, left: 20),
      height: 50,
      width: 70,
      child: DropdownButton<String>(
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
      ),
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
      title: Text(
        "Shipping Information",
        style: TextStyle(fontSize: 20),
      ),
      trailing: Icon(Icons.arrow_drop_down),
      backgroundColor: Colors.white,
      children: [
        Column(
          children: [
            Container(
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.only(bottom: 15, left: 20),
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
