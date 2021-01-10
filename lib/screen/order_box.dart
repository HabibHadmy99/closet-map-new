import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class OrderBox extends StatelessWidget {
  @override
  Widget build(BuildContext content) {
    return Container(
        padding: EdgeInsets.fromLTRB(15, 30, 15, 0),
        child: Container(
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.black,
                blurRadius: 10,
              )
            ],
            borderRadius: BorderRadius.circular(30),
            color: Colors.white,
          ),
          height: 150,
          child: Padding(
            padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    RichText(
                        text: TextSpan(children: <TextSpan>[
                      TextSpan(
                          text: 'Order: ',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 10)),
                      TextSpan(
                        text: '#123',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 10),
                      ),
                    ])),
                    Text('2021-01-11',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 10))
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Text('Tacking Number: ',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 10)),
                        Padding(
                          padding: const EdgeInsets.only(left: 30),
                          child: Text('90529379 ',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 10)),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Text(
                              'Quantity: ',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 10),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 20),
                              child: Text('1',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 10)),
                            ),
                          ],
                        ),
                        Row(
                          children: <Widget>[
                            Text(
                              'Totat Amount: ',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 10),
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                              child: Text(
                                '\$ 50',
                                //total amount
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 10),
                              ),
                            ),
                          ],
                        )
                      ],
                    )
                  ],
                ),
                SizedBox(
                  height: 30,
                ),
              ],
            ),
          ),
        ));
  }
}
