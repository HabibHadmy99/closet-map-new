import 'package:closet_map/List/list.dart';
import 'package:closet_map/screen/home.dart';
import 'package:flutter/material.dart';

class Scpayment extends StatelessWidget {
  static String routeName = "/cart";
  static Route<dynamic> route() =>
      MaterialPageRoute(builder: (_) => Scpayment());

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
          onPressed: () => Navigator.pushReplacement(context, Home.route()),
        ),
      ),
      body: Stack(
        children: [
          buildsuccessscreen(context),
        ],
      ),
    );
  }

  buildsuccessscreen(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            width: 392,
            height: 520,
            child: AspectRatio(
              aspectRatio: 1,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.red[300],
                  image: new DecorationImage(
                      image: new AssetImage("assets/images/success.PNG"),
                      fit: BoxFit.fill),
                  borderRadius: BorderRadius.circular(0),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          buildButtondone(context),
        ],
      ),
    );
  }

  buildButtondone(BuildContext context) {
    return Container(
      child: Column(
        children: [
          RaisedButton(
            onPressed: () => Navigator.pushReplacement(context, Home.route()),
            textColor: Colors.white,
            padding: const EdgeInsets.all(.0),
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
              padding: const EdgeInsets.all(12.0),
              child: const Text('Done', style: TextStyle(fontSize: 25)),
            ),
          ),
        ],
      ),
    );
  }
}
