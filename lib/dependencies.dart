import 'package:closet_map/Services/OrderService/order_data_service_mock.dart';
import 'package:get_it/get_it.dart';

GetIt service = GetIt.instance;

void init() {
  service.registerLazySingleton(() => OrderDataServiceMock());
}
