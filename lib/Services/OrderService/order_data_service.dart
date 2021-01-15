import 'package:closet_map/Models/item_model.dart';

abstract class OrderDataService {
  Future<List<Items>> getOrderList();
}
