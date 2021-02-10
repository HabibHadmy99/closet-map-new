import 'dart:convert';

import 'package:closet_map/Models/item_model.dart';
import 'package:http/http.dart';

import 'dataservice.dart';
import 'items_dataservice.dart';

final _itemlistDatabase = <Items>[
  Items(
    id: "1",
    name: 'Polo v1',
    brand: 'Polo Ralph',
    image: 'assets/images/four.jpg',
    quantity: 6,
    price: 100,
    desc: 'This is item description for Polo v1',
  ),
  Items(
    id: "2",
    name: 'Swagor',
    brand: 'Levis',
    image: 'assets/images/two.jpg',
    quantity: 6,
    price: 100,
    desc: 'This is item description for Swagor',
  ),
  Items(
    id: "3",
    name: 'Munchik',
    brand: 'Guess',
    image: 'assets/images/three.jpg',
    quantity: 6,
    price: 120,
    desc: 'This is item description for Munchik',
  ),
];

class ItemsDataServiceMock implements ItemsDataService {
  //get item list
  Future<List<Items>> getItemsList() async {
    final listJson = await dataService.get('item');
    return (listJson as List)
        .map((itemJson) => Items.fromJson(itemJson))
        .toList();
  }

  //update items
  Future<Items> updateItemsName(
      {String id, String name, String brand, String desc}) async {
    final json = await dataService
        .patch('item/$id', data: {'name': name, 'brand': brand, 'decs': desc});
    return Items.fromJson(json);
    /*final matchedItems = _itemlistDatabase
        .firstWhere((item) => item.id == id); //checkmatching item

    if (name.length != 0) {
      matchedItems.name = name;
    }
    if (brand.length != 0) {
      matchedItems.brand = brand;
    }
    if (desc.length != 0) {
      matchedItems.desc = desc;
    }*/

    /*matchedItems.name = name;
    matchedItems.brand = brand;
    matchedItems.desc = desc; 
    else if (quant != 0) {
      matchedItems.quantity = quant;
    }else if (price != 0) {
      matchedItems.price = price;
    }*/
    //return matchedItems;
  }

  //update desc
  /*Future<Items> updateItemsDesc{int id, String desc}) async {
    final matchedItems =
        _itemlistDatabase.firstWhere((Items) => Items.id == id);
    matchedItems.desc = desc;
    return matchedItems;
  } */

  //create new item
  /*Future<Items> createItems({Items Items}) async {
    //Items.id = _nextId++;
    //_ItemssDatabase.add(Items);
    return Items;
  }
*/
  //delete item
  Future<Items> deleteItems({String id}) async {
    await dataService.delete('order/$id');
  }
}
