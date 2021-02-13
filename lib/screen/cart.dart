import 'package:closet_map/List/list.dart';
import 'package:closet_map/Models/item_model.dart';
import 'package:closet_map/Services/OrderService/order_data_service_mock.dart';
import 'package:closet_map/Services/user_data_service.dart';
import 'package:closet_map/nav_bar/CustomAppBar.dart';
import 'package:closet_map/screen/orderlist_viewmodel.dart';
import 'package:flutter/material.dart';
import '../dependencies.dart';
import 'Checkout.dart';
import 'view.dart';

List<Items> order;

class CartScreen extends StatefulWidget {
  static String routeName = "/cart";
  static Route<dynamic> route() =>
      MaterialPageRoute(builder: (_) => CartScreen());

  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  /*Widget build(BuildContext context) {
    final OrderDataServiceMock orderDataService = service();
    final UserDataService userDS = service();
    return FutureBuilder<List<Items>>(
        future: orderDataService.getOrderList(userID: userDS.getUserID()),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            order = snapshot.data;
            return buildCart(context);
          }
          order = [];
          return buildCart(context);
        });
  }*/

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.1,
        centerTitle: true,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          color: Colors.black,
          onPressed: () {
            //Navigator.pop(context);
          },
        ),
        title: Column(
          children: [
            Text(
              "Your Cart",
              style: TextStyle(color: Colors.black),
            ),
            /* Text(
              "${order.length} items",
              style: Theme.of(context).textTheme.caption,
            ),*/
            Expanded(
                child: View<OrderlistViewmodel>(
                    initViewmodel: (orderlistViewmodel) =>
                        orderlistViewmodel.getList(),
                    builder: (context, orderlistViewmodel, __) {
                      final order = orderlistViewmodel.orders;

                      if (order == null) {
                        return Center(child: CircularProgressIndicator());
                      }
                      orderlistViewmodel.getList();
                      return ListView.separated(
                          scrollDirection: Axis.vertical,
                          itemCount: order.length,
                          itemBuilder: (context, index) {
                            final _order = order[index];
                            return Column(
                              children: [
                                Row(
                                  children: [
                                    SizedBox(
                                      width: 88,
                                      child: AspectRatio(
                                        aspectRatio: 1,
                                        child: Container(
                                          decoration: BoxDecoration(
                                            color: Color(0xFFFFE6E6),
                                            borderRadius:
                                                BorderRadius.circular(15),
                                          ),
                                          child: Image.asset(_order.image),
                                        ),
                                      ),
                                    ),
                                    SizedBox(width: 20),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          _order.name + " " + _order.brand,
                                          style: TextStyle(
                                              fontSize: 16,
                                              color: Colors.black),
                                          maxLines: 2,
                                        ),
                                        Text.rich(
                                          TextSpan(
                                            text: "\$${_order.price}",
                                            style: TextStyle(
                                                fontWeight: FontWeight.w600,
                                                color: Colors.orange),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Spacer(),
                                    Column(
                                      children: [
                                        FlatButton(
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(18.0),
                                              side: BorderSide(
                                                  color: Colors.red)),
                                          color: Colors.white,
                                          textColor: Colors.red,
                                          padding: EdgeInsets.all(8.0),
                                          onPressed: () {
                                            /*final OrderDataServiceMock
                                                orderDataService = service();
                                            orderDataService.deleteItems(
                                                id: _order[index]
                                                    .id); // Delete todo at the database
                                            setState(() => _order
                                                .removeAt(index)); */ // Update UI
                                          },
                                          child: Text(
                                            "Delete".toUpperCase(),
                                            style: TextStyle(
                                              fontSize: 14.0,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            );
                          },
                          separatorBuilder: (context, index) => Divider(
                                color: Colors.orangeAccent,
                              ));
                    }))
          ],
        ),
      ),
      bottomNavigationBar: CustomAppBar(),
      backgroundColor: Colors.white,
      //body: Expanded(child: null),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          FloatingActionButton.extended(
            heroTag: null,
            onPressed: () =>
                Navigator.pushReplacement(context, Checkout.route()),
            label: Text('Checkout'),
            icon: Icon(Icons.login_rounded),
          ),
        ],
      ),
    );
  }

  Scaffold _buildFetchingDataScreen() {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            CircularProgressIndicator(),
            SizedBox(height: 50),
            Text('Fetching order... Please wait'),
          ],
        ),
      ),
    );
  }
}
