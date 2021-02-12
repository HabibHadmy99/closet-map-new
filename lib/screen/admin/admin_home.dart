import 'package:closet_map/List/list.dart';
import 'package:closet_map/List/user.dart';
import 'package:closet_map/Models/item_model.dart';
import 'package:closet_map/Services/items_service.dart';
import 'package:closet_map/nav_bar/CustomAppBar.dart';
import 'package:closet_map/screen/itemlist_viewmodel.dart';
import 'package:closet_map/screen/view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../dependencies.dart';
import '../home.dart';
import '../shop.dart';
import 'admin_changeDetails.dart';

User user;

class AdminHomeScreen extends StatelessWidget {
 
  static Route<dynamic> route(current) {
    user = current;
    return MaterialPageRoute(builder: (_) => AdminHomeScreen());
  }

  @override


  Widget build(BuildContext context){
    return Scaffold(
      bottomNavigationBar: CustomAppBar(
        navtype: adminNavBar,
      ),
      body: Column(
        children: <Widget>[
          HomeTopScreen(
            username: user.name,
            headerWords: 'Welcome, \n' + user.name,
          ),
          Container(
            padding: EdgeInsets.only(left: 20),
            alignment: Alignment.centerLeft,
            child: Text(
              'Your item list:',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            child: View<ItemlistViewmodel>(
                  initViewmodel: (itemlistViewmodel)=> itemlistViewmodel.getList(),
                  builder: (context, itemlistViewmodel, __) {

              final items = itemlistViewmodel.items;

              if (items == null) {
                  return Center(
                      child: CircularProgressIndicator(),
                    );
                      }
              itemlistViewmodel.getList();
              return ListView.builder(
                itemCount: items.length,
                itemBuilder: (context, index) {
                  final _item = items[index];
                  return ListTile(
                    contentPadding: EdgeInsets.only(left: 0),
                    title: Text(
                      _item.name,
                      style: TextStyle(letterSpacing: 1),
                    ),
                    leading: Container(
                      width: 100,
                      height: 80,
                      child: Image(
                          image: AssetImage(
                            _item.image,
                          ),
                          fit: BoxFit.cover),
                    ),
                    trailing: Icon(Icons.keyboard_arrow_right),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              ItemChangeForm(itemsList: items[index]),
                        ),
                      );
                    },
                  );
                },
              );
            },
          ))
        ],
      ),
      /*  floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        backgroundColor: Colors.pinkAccent,
        onPressed: () {},
      ), */
    );
  }

}
/*, */
