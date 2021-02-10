import 'package:closet_map/Models/item_model.dart';

abstract class OrderDataService {
  Future<List<Items>> getOrderList();
  Future<Items> updateCartlist({Items items});
  Future deleteItems({String id});
}
