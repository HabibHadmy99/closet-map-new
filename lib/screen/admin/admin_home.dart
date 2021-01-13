
import 'package:closet_map/List/list.dart';
import 'package:closet_map/nav_bar/CustomAppBar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../home.dart';
import '../shop.dart';


class AdminHomeScreen extends StatelessWidget {
  static Route<dynamic> route() =>
      MaterialPageRoute(builder: (_) => AdminHomeScreen());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CustomAppBar(),
      body: Column(
        children: <Widget>[
          HomeTopScreen(username: 'AdminUser',headerWords: 'Welcome, Admin',),
          Container(
            padding: EdgeInsets.only(left: 20),
            alignment: Alignment.centerLeft,
            child: Text('Your item list:',style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold),
              ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: shirts.length,
              itemBuilder: (context, index){
                return ListTile(
                  contentPadding: EdgeInsets.only(left: 0),
                  title: Text(shirts[index]['name']),
                  leading: Container(
                      width: 100,
                      height:80,
                      child: Image(
                        image: AssetImage(shirts[index]['image'],),
                        fit: BoxFit.cover), 
                      ),
                  
                  trailing: Icon(Icons.keyboard_arrow_right),
                  onTap: (){},
                  );
              } ,
              ),
          )
          ],
        ),
       floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        backgroundColor: Colors.pinkAccent,
        onPressed: () {},
      ),
    );
  }
}
/*, */
