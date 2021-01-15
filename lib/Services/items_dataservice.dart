import 'package:closet_map/Models/item_model.dart';

abstract class ItemsDataService {
  Future<List<Items>> getItemsList();
  Future<Items> updateItemsName({int id, String name,String brand, String desc});
  Future deleteItems({int id});
/*
 Future<Items> updateItemsDesc({int id, String desc});
 Future<Items> updateItemsDesc({int id, String desc});
  
  Future<Items> createItems({Items items});
   */
}
