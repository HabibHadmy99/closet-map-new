import 'package:closet_map/List/list.dart';
import 'package:closet_map/nav_bar/CustomAppBar.dart';
import 'package:flutter/material.dart';

class ItemDetailScreen extends StatelessWidget {
  static Route<dynamic> route() =>
      MaterialPageRoute(builder: (_) => ItemDetailScreen());

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
                child: ListView(
                    scrollDirection: Axis.vertical,
                    children: <Widget>[
                      Container(
                  //image container
                  height: 400,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(shirts[0]['image']),
                          fit: BoxFit.cover)),
                ),
                Container( //dropdowns  
                child: ListBody( 
                  children: <Widget>[

                    Container(//dropdown1
                      margin: EdgeInsets.only(right: 300,left:10),
                      height: 40,
                      width: 30,
                      child: MyStatefulWidget(),
                    )
                  ],
                )
              ),
              Container(//title & price
                 padding: EdgeInsets.all(10),
                height: 50,
                child: Row(children: [
                  Container(
                    alignment: Alignment.centerLeft,
                    child: Text(shirts[0]['name'],
                      style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold)),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 220),
                    alignment: Alignment.centerRight,
                    child: Text("100\$",
                      style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold))
                  )
                ],
                )
              ),
              Container( //description
                 padding: EdgeInsets.only(left:10,right: 30,),
                 child: Text('Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam viverra nulla a erat tempus auctor. Ut a luctus odio. Aenean elementum, justo vel scelerisque venenatis, mi libero interdum dui, vel ultricies eros diam sed velit.',
                  style: TextStyle(fontSize: 15, color: Colors.grey,)),
              ),
              Container( //add to cart
                padding: EdgeInsets.only(left:50,right: 50,top: 10),
                child: FlatButton(
                  child: Text('Add to Cart',style: TextStyle(color: Colors.white),),
                  color: Colors.deepOrange,
                  shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(30.0)),
                  onPressed: (){},
                ),
              )
                    ],
                )
              ),
              
            ],
          ),
        ),
      ),
    );
  }
}

class MyStatefulWidget extends StatefulWidget {
  MyStatefulWidget({Key key}) : super(key: key);

  @override
  _MyStatefulWidgetState createState() => _MyStatefulWidgetState();
}

/// This is the private State class that goes with MyStatefulWidget.
class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  String dropdownValue = 'Black';

  @override
  Widget build(BuildContext context) {
    return  DropdownButton<String>(
        value: dropdownValue,
        icon: Icon(Icons.arrow_drop_down),
        iconSize: 24,
        elevation: 20,
        style: TextStyle(color: Colors.black38),

        onChanged: (String newValue) {
          setState(() {
            dropdownValue = newValue;
          });
        },
        items: <String>['Black', 'White', 'Green', 'Orange']
            .map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
      
    );
  }
}