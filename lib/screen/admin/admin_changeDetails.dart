import 'package:closet_map/List/list.dart';
import 'package:closet_map/Models/item_model.dart';
import 'package:closet_map/nav_bar/CustomAppBar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ItemChangeForm extends StatefulWidget {
  final Items itemsList;
  @override
  ItemChangeForm({this.itemsList});
  _ItemChangeForm createState() => _ItemChangeForm();
}

class _ItemChangeForm extends State<ItemChangeForm> {
  var q = 6;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CustomAppBar(navtype: adminNavBar,),
      appBar: AppBar(
        title: Text(
          widget.itemsList.name,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 25,
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.orangeAccent,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(30),
        child: Column(children: [
          TextField(
            label: 'Name',
            initVal: widget.itemsList.name,
          ),
          TextField(
            label: 'Brand',
            initVal: widget.itemsList.brand,
          ),
          TextField(
            label: 'Description',
            initVal: widget.itemsList.desc,
            max: 350,
          ),
          //quantity
          Container(
            alignment: Alignment.centerLeft,
            child: Column(
             crossAxisAlignment: CrossAxisAlignment.start,
              children:  [
                Text("Quantity", 
                  style: TextStyle(
                    color: Colors.orangeAccent,
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    
                  ),
                  textAlign: TextAlign.left,
                ),
                             Row(
                children: [
                  
                  IconButton(icon: Icon(Icons.add),
                  onPressed: (){
                    setState(() {
                       q += 1;
                    });
                  },
                  iconSize: 15,
                  splashRadius: 15,),
                  Text(q.toString(),),
                  IconButton(icon: Icon(Icons.remove),
                  onPressed: (){
                    setState(() {
                       q -= 1;
                    });
                  },
                  iconSize: 15,
                  splashRadius: 15,),
                ],
                ),
                
              ]
              
        
            ),
            )
        ]),
      ),
            floatingActionButton: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            FloatingActionButton.extended(
              backgroundColor: Colors.green,
              label: const Text('Save'),
              //icon: const Icon(Icons.check_circle),
              heroTag: null,
              onPressed: (){}
            ),
           /* FloatingActionButton.extended(
              label: const Text('Cancel'),
              icon: const Icon(Icons.cancel),
              heroTag: null,
              onPressed: (){}
            ), */
          ],
        ),
    );
  }
}

class TextField extends StatelessWidget {
  final label;
  final initVal;
  final max;

  TextField({this.label, this.initVal,this.max=30});

  Widget build(BuildContext context) {
    return Container(
      height: 80,
      width: 350,
      child: TextFormField(
        cursorColor: Theme.of(context).cursorColor,
        initialValue: initVal,
        maxLength: max,
        decoration: InputDecoration(
          labelText: label,
          labelStyle: TextStyle(
              color: Colors.orangeAccent,
              fontSize: 20,
              fontWeight: FontWeight.bold),
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.grey),
          ),
        ),
      ),
    );
  }
}

class ItemProvider extends ChangeNotifier {
  void changeName() {
    //itemlist[index].name = user input in name field
  }
}
