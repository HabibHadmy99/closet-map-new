import 'package:closet_map/List/user.dart';
import 'package:closet_map/Models/item_model.dart';
import 'package:closet_map/Services/OrderService/order_data_service.dart';
import 'package:closet_map/Services/dataservice.dart';
import 'package:closet_map/Services/user_data_service.dart';
import 'package:closet_map/screen/cart.dart';
import 'package:closet_map/screen/viewmodel.dart';

import '../dependencies.dart';

class OrderlistViewmodel extends Viewmodel {
  List<Items> orders;
  User _user;

  User get user => _user;
  /*set user(User user) {
    _user = user;
    getList();
  }*/

  OrderlistViewmodel();
  OrderDataService get dataservice => service();
  UserDataService get dataService => service();

  Future<void> getList() async {
    //if (user == null) return;
    final userid = dataService.getUserID();
    orders = await dataservice.getOrderList(userID: userid);
    notifyListeners();
  }

  Future<void> updateOrderStatus(int index) async {
    final updatedOrder = await dataservice.updateCartlist(
        item_id: orders[index].id,
        userID: orders[index].userID,
        items: orders[index]);
    orders[index].id = updatedOrder.id;
    orders[index].userID = updatedOrder.userID;
    orders[index] = updatedOrder;

    notifyListeners();
  }

  Future<void> removeOrder(int index) async {
    await dataservice.deleteItems(id: orders[index].id);
    orders.removeAt(index);
    notifyListeners();
  }
}
