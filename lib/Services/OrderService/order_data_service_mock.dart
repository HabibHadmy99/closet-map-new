import 'package:closet_map/List/list.dart';
import 'package:closet_map/Models/item_model.dart';

import 'order_data_service.dart';

final _orderDatabase = <Items>[
  //Items(name: "", brand: "xyz", quantity: 2, price: 1),
  ...itemlist
];

class OrderDataServiceMock implements OrderDataService {
  Future<List<Items>> getOrderList() async {
    return [..._orderDatabase];
  }
}
