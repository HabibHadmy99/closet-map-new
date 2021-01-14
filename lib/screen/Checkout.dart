import 'package:closet_map/List/list.dart';
import 'package:closet_map/screen/succ_payment.dart';
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
          buildPayment(context),
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

  buildPayment(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 15.0),
      width: 500,
      height: 1000.0,
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
            height: 30,
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 5.0),
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
                      image: new DecorationImage(
                          image: new AssetImage("assets/images/logo1.png")),
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
                      image: new DecorationImage(
                          image: new AssetImage("assets/images/logo2.png")),
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
                      image: new DecorationImage(
                          image: new AssetImage("assets/images/logo3.png")),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 60),
          buildText(),
          SizedBox(height: 50),
          buildButtonpay(context),
        ],
      ),
    );
  }

  buildText() {
    return Container(
      child: Column(
        children: [
          new TextFormField(
            decoration: new InputDecoration(
              labelText: "Card No.",
              fillColor: Colors.white,
              border: new OutlineInputBorder(
                borderRadius: new BorderRadius.circular(25.0),
                borderSide: new BorderSide(),
              ),
            ),
            style: new TextStyle(
              fontFamily: "Poppins",
            ),
          ),
          SizedBox(height: 20),
          new TextFormField(
            decoration: new InputDecoration(
              labelText: "CardHolder name",
              fillColor: Colors.white,
              border: new OutlineInputBorder(
                borderRadius: new BorderRadius.circular(25.0),
                borderSide: new BorderSide(),
              ),
            ),
            style: new TextStyle(
              fontFamily: "Poppins",
            ),
          ),
          SizedBox(height: 20),
          new TextFormField(
            decoration: new InputDecoration(
              labelText: "Expiry date",
              fillColor: Colors.white,
              border: new OutlineInputBorder(
                borderRadius: new BorderRadius.circular(25.0),
                borderSide: new BorderSide(),
              ),
            ),
            style: new TextStyle(
              fontFamily: "Poppins",
            ),
          ),
          SizedBox(height: 20),
          new TextFormField(
            decoration: new InputDecoration(
              labelText: "Security code",
              fillColor: Colors.white,
              border: new OutlineInputBorder(
                borderRadius: new BorderRadius.circular(25.0),
                borderSide: new BorderSide(),
              ),
            ),
            style: new TextStyle(
              fontFamily: "Poppins",
            ),
          ),
        ],
      ),
    );
  }

  buildButtonpay(BuildContext context) {
    return Container(
      child: Column(
        children: [
          RaisedButton(
            onPressed: () =>
                Navigator.pushReplacement(context, Scpayment.route()),
            textColor: Colors.white,
            padding: const EdgeInsets.all(0.0),
            child: Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: <Color>[
                    Color(0xFF0D47A1),
                    Color(0xFF1976D2),
                    Color(0xFF42A5F5),
                  ],
                ),
              ),
              padding: const EdgeInsets.all(10.0),
              child: const Text('Pay Now', style: TextStyle(fontSize: 20)),
            ),
          ),
        ],
      ),
    );
  }
}
