import 'package:closet_map/Models/item_model.dart';
import 'package:closet_map/Services/OrderService/order_data_service_mock.dart';
import 'package:closet_map/nav_bar/CustomAppBar.dart';
import 'package:closet_map/screen/order_box.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../dependencies.dart';

class Order extends StatefulWidget {
  static Route<dynamic> route() => MaterialPageRoute(builder: (_) => Order());
  @override
  _OrderState createState() => _OrderState();
}

class _OrderState extends State<Order> {
  List<Items> _order;

  @override
  Widget build(BuildContext context) {
    final OrderDataServiceMock orderDataService = service();

    return FutureBuilder<List<Items>>(
        future: orderDataService.getOrderList(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            _order = snapshot.data;
            return _buildMainScreen();
          }
          return _buildFetchingDataScreen();
        });
  }

  Scaffold _buildFetchingDataScreen() {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            CircularProgressIndicator(),
            SizedBox(height: 50),
            Text('Fetching todo... Please wait'),
          ],
        ),
      ),
    );
  }

  Scaffold _buildMainScreen() {
    return Scaffold(
        body: MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              primarySwatch: Colors.red,
            ),
            home: OrderBox() //roundTab,
            ));
  }
}
