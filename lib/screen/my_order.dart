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
      home: roundTab,
    ));
  }
}

DefaultTabController get roundTab => DefaultTabController(
    length: 3,
    child: Scaffold(
      bottomNavigationBar: CustomAppBar(),
      appBar: AppBar(
        title: Text(
          'My Order',
          style: TextStyle(
              fontWeight: FontWeight.bold, fontSize: 30, color: Colors.white),
        ),
        backgroundColor: Colors.orangeAccent,
        elevation: 0,
        bottom: TabBar(
            unselectedLabelColor: Colors.orangeAccent[500],
            //indicatorSize: TabBarIndicatorSize.label,
            indicator: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color: Colors.redAccent),
            tabs: [
              Tab(
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      border: Border.all(color: Colors.orangeAccent, width: 0)),
                  child: Align(
                    alignment: Alignment.center,
                    child: Text("To Pay"),
                  ),
                ),
              ),
              Tab(
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      border: Border.all(color: Colors.orangeAccent, width: 0)),
                  child: Align(
                    alignment: Alignment.center,
                    child: Text("To Ship"),
                  ),
                ),
              ),
              Tab(
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      border: Border.all(color: Colors.orangeAccent, width: 0)),
                  child: Align(
                    alignment: Alignment.center,
                    child: Text("To Receive"),
                  ),
                ),
              ),
            ]),
      ),
      body: TabBarView(children: [
        buildOrderList(),
        buildOrderList(),
        buildOrderList(),
        //Icon(Icons.movie),
        //Icon(Icons.games),
      ]),
    ));

ListView buildOrderList() {
  return ListView.builder(
    shrinkWrap: true,
    itemCount: 3,
    itemBuilder: (context, index) {
      return OrderBox();
    },
  );
}
