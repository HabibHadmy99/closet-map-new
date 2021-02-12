
import 'package:closet_map/Models/item_model.dart';
import 'dataservice.dart';
import 'items_dataservice.dart';


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

    final json = await dataService.patch('item/$id', data: {'name': name, 'brand': brand, 'desc': desc});
    return Items.fromJson(json);
    
  }

 
  //delete item
  Future<Items> deleteItems({String id}) async {
    await dataService.delete('order/$id');
  }
}
