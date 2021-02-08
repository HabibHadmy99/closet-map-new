import 'package:closet_map/List/list.dart';
import 'package:closet_map/Models/item_model.dart';
import 'package:closet_map/Models/order_list.dart';

import 'order_data_service.dart';

final _itemlistDatabase2 = <Items>[
  Items(
    id: 1,
    name: 'Polo v1',
    brand: 'Polo Ralph',
    image: 'assets/images/four.jpg',
    quantity: 6,
    price: 100,
    desc: 'This is item description for Polo v1',
  ),
  Items(
    id: 2,
    name: 'Swagor',
    brand: 'Levis',
    image: 'assets/images/two.jpg',
    quantity: 6,
    price: 100,
    desc: 'This is item description for Swagor',
  ),
  Items(
    id: 3,
    name: 'Munchik',
    brand: 'Guess',
    image: 'assets/images/three.jpg',
    quantity: 6,
    price: 120,
    desc: 'This is item description for Munchik',
  ),
];

var lsit = <OrderList>[
  OrderList(
    userid: 1,
    order: _itemlistDatabase2 ),
];

class OrderDataServiceMock implements OrderDataService {
  Future<List<Items>> getOrderList() async {
    return [..._itemlistDatabase2];
  }

  Future<Items> updateCartlist({String id,Items items}) async {
    _itemlistDatabase2.add(items);
    return items;
  }

  // ignore: missing_return
  Future deleteItems({int id}) {
    _itemlistDatabase2.removeWhere((items) => items.id == id);
  }
}
