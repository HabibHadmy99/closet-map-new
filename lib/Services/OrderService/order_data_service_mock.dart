import 'package:closet_map/List/list.dart';
import 'package:closet_map/Models/item_model.dart';
import 'package:closet_map/Models/order_list.dart';
import 'package:closet_map/Services/dataservice.dart';

import 'order_data_service.dart';

class OrderDataServiceMock implements OrderDataService {
  Future<List<Items>> getOrderList({String userID}) async {
    var list = <Items>[];
    final listJson = await dataService.get('order');
    if (listJson != null) {
      list = (listJson as List).map((list) => Items.fromJson(list)).toList();
    }
  
    final matched = list.where((item) => item.userID == userID).toList();
    return matched;
  }

  Future<Items> updateCartlist(
      {Items items, String item_id, String userID}) async {
    await dataService.patch('item/$item_id', data: {'userID': userID});
    final itemnew = await dataService.get('item/$item_id');
    final json = await dataService.post('order', data: itemnew);
    return Items.fromJson(json);
  }

  // ignore: missing_return
  Future deleteItems({String id}) async {
    await dataService.delete('order/$id');
    //_itemlistDatabase2.removeWhere((items) => items.id == id);
  }
}
