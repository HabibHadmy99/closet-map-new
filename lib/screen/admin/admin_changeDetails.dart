import 'package:closet_map/List/list.dart';
import 'package:closet_map/Models/item_model.dart';
import 'package:closet_map/Services/items_service.dart';
import 'package:closet_map/nav_bar/CustomAppBar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../dependencies.dart';
import 'admin_home.dart';

class ItemChangeForm extends StatefulWidget {
  final Items itemsList;
  @override
  ItemChangeForm({this.itemsList});
  _ItemChangeForm createState() => _ItemChangeForm();
}

class _ItemChangeForm extends State<ItemChangeForm> {
  final ItemsDataServiceMock todoDataService = service();
  final nameController = TextEditingController();
  final brandController = TextEditingController();
  final descController = TextEditingController();
  final quantityController = TextEditingController();
  final priceController = TextEditingController();

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
              hint: widget.itemsList.name,
              label: 'Name',
              //initVal: widget.itemsList.name,
              cont: nameController),
          TextField(
            hint: widget.itemsList.brand,
            label: 'Brand',
            //initVal: widget.itemsList.brand,
            cont: brandController,
          ),
          TextField(
            hint: widget.itemsList.desc,
            label: 'Description',
            //initVal: widget.itemsList.desc,
            max: 350,
            cont: descController,
          ),
          //quantity
          /*
          TextField(
            label: 'Quantity',
            //initVal: widget.itemsList.desc,
            cont: quantityController,
            type: TextInputType.number,
          ),
          TextField(
            label: 'Price',
            //initVal: widget.itemsList.desc,
            cont: priceController,
            type: TextInputType.number,
          ), */
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
              onPressed: () {
                todoDataService.updateItemsName(
                  id: widget.itemsList.id,
                  name: nameController.text,
                  brand: brandController.text,
                  desc: descController.text,
                );
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AdminHomeScreen(),
                  ),
                );
              }),
          /* FloatingActionButton.extended(
                              price: double.parse(priceController.text),
                    quant: int.parse(quantityController.text)
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
  final cont;
  final type;
  final hint;
  @override
  TextField(
      {this.hint,
      this.label,
      this.initVal,
      this.max = 30,
      this.cont,
      this.type = TextInputType.text});

  Widget build(BuildContext context) {
    return Container(
      height: 80,
      width: 350,
      child: TextFormField(
        
        keyboardType: type,
        controller: cont,
        cursorColor: Theme.of(context).cursorColor,
        initialValue: initVal,
        maxLength: max,
        decoration: InputDecoration(
      
          hintText: hint,
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

class Nums extends StatefulWidget {
  var type;
  final name;
  @override
  Nums({this.type, this.name});
  _NumsChange createState() => _NumsChange();
}

class _NumsChange extends State<Nums> {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(
          widget.name,
          style: TextStyle(
            color: Colors.orangeAccent,
            fontSize: 15,
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.left,
        ),
        Row(
          children: [
            IconButton(
              icon: Icon(Icons.add),
              onPressed: () {
                setState(() {
                  widget.type += 1;
                });
              },
              iconSize: 15,
              splashRadius: 15,
            ),
            Text(
              widget.type.toString(),
            ),
            IconButton(
              icon: Icon(Icons.remove),
              onPressed: () {
                setState(() {
                  widget.type -= 1;
                });
              },
              iconSize: 15,
              splashRadius: 15,
            ),
          ],
        ),
      ]),
    );
  }
}
