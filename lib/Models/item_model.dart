import 'package:flutter/cupertino.dart';

class Items {
  String brand;
  String image;
  int quantity;
  double price;
  String desc;
  String name;
  String id;
  String userID;

  Items(
      {this.name,
      this.brand,
      this.image,
      this.quantity,
      this.price,
      this.desc,
      this.id,
      this.userID});

  Items.fromJson(Map<String, dynamic> json)
      : this(
            id: json['id'].toString(),
            name: json['name'],
            brand: json['brand'],
            image: json['image'],
            quantity: json['quantity'],
            price: json['price'],
            desc: json['desc'],
            userID: json['userID']);
  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'brand': brand,
        'image': image,
        'quantity': quantity,
        'price': price,
        'desc': desc
      };
}
