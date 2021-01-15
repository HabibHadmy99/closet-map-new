
import 'package:closet_map/List/list.dart';
import 'package:closet_map/Models/item_model.dart';
import 'package:closet_map/Services/items_service.dart';
import 'package:closet_map/nav_bar/CustomAppBar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../dependencies.dart';
import '../home.dart';
import '../shop.dart';
import 'admin_changeDetails.dart';


class AdminHomeScreen extends StatelessWidget {
  List<Items> _items;
  static Route<dynamic> route() =>
      MaterialPageRoute(builder: (_) => AdminHomeScreen());

  @override

  Widget build(BuildContext context) {
    
    final ItemsDataServiceMock todoDataService = service();

    return FutureBuilder<List<Items>>(
        future: todoDataService.getItemsList(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            _items = snapshot.data;
            return _buildAdminHome();
          }
          return _buildFetchingDataScreen();
        });
  }
  
  Scaffold _buildAdminHome(){
    
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
                 final _item = _items[index];
                return ListTile(
                  contentPadding: EdgeInsets.only(left: 0),
                  title: Text(
                    _item.name,
                    style: TextStyle(letterSpacing: 1),
                  ),
                  leading: Container(
                      width: 100,
                      height:80,
                      child: Image(
                        image: AssetImage(_item.image,),
                        fit: BoxFit.cover), 
                      ),
                  
                  trailing: Icon(Icons.keyboard_arrow_right),
                  onTap: (){
                    Navigator.push(
                       context,
                       MaterialPageRoute(
                        builder: (context) => ItemChangeForm(itemsList: _item),
                    ),
                  );
                  },
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

  Scaffold _buildFetchingDataScreen() {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            CircularProgressIndicator(),
            SizedBox(height: 50),
            Text('Loading items...'),
          ],
        ),
      ),
    );
  }
}
/*, */
