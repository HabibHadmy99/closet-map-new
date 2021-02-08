import 'package:closet_map/List/user.dart';
import 'package:closet_map/Models/item_model.dart';
import 'package:closet_map/Services/items_dataservice.dart';
import 'package:closet_map/Services/items_service.dart';
import 'package:closet_map/screen/viewmodel.dart';

import '../dependencies.dart';

class ItemlistViewmodel extends Viewmodel {
  List<Items> items;

  ItemlistViewmodel(){
    getList();
  }
  ItemsDataServiceMock get dataService => service();
  Future<void> getList() async {
    items = await dataService.getItemsList();
    notifyListeners();
  }
}
