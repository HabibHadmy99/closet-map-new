import 'package:closet_map/Services/OrderService/order_data_service_mock.dart';
import 'package:closet_map/Models/mock_user.dart';
import 'package:closet_map/Services/user_data_service.dart';
import 'package:get_it/get_it.dart';

import 'Services/items_service.dart';

GetIt service = GetIt.instance;

void init() {
  service.registerLazySingleton(() => OrderDataServiceMock());
  service.registerLazySingleton(() => ItemsDataServiceMock());
  service.registerLazySingleton<UserDataService>(() => UserDataServiceMock());
}
