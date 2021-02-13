import 'package:closet_map/Models/item_model.dart';

abstract class OrderDataService {
  Future<List<Items>> getOrderList({String userID});
  Future<Items> updateCartlist({Items items,String item_id,String userID});
  Future deleteItems({String id});
}
