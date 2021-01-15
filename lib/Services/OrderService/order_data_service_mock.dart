import 'package:closet_map/Models/item_model.dart';

import 'order_data_service.dart';

final _orderDatabase = <Items>[
  Items(name: "abc", brand: "xyz", quantity: 2, price: "RM 1"),
];

class OrderDataServiceMock implements OrderDataService {
  Future<List<Items>> getOrderList() async {
    return [..._orderDatabase];
  }
}
