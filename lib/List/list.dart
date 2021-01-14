import 'package:closet_map/Models/item_model.dart';
import 'package:flutter/material.dart';

List<Map> shirts = [
  {
    'name': 'Polo v1',
    'brand': 'Polo Ralph',
    'image': 'assets/images/four.jpg',
    'quantity': 6,
    'price': 100,
    'desc':
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam viverra nulla a erat tempus auctor. Ut a luctus odio. Aenean elementum, justo vel scelerisque venenatis, mi libero interdum dui, vel ultricies eros diam sed velit.'
  },
  {
    'name': 'Swagor',
    'brand': 'Levis',
    'image': 'assets/images/two.jpg',
    'quantity': 6,
    'price': 100,
    'desc':
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam viverra nulla a erat tempus auctor. Ut a luctus odio. Aenean elementum, justo vel scelerisque venenatis, mi libero interdum dui, vel ultricies eros diam sed velit.'
  },
  {
    'name': 'Munchik',
    'brand': 'Guess',
    'image': 'assets/images/three.jpg',
    'quantity': 6,
    'price': 120,
    'desc':
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam viverra nulla a erat tempus auctor. Ut a luctus odio. Aenean elementum, justo vel scelerisque venenatis, mi libero interdum dui, vel ultricies eros diam sed velit.'
  },
];

List<Items> itemlist = [
  Items(
    name: 'Polo v1',
    brand: 'Polo Ralph',
    image: 'assets/images/four.jpg',
    quantity: 6,
    price: 100,
    desc: 'This is item description for Polo v1',
  ),
  Items(
    name: 'Swagor',
    brand: 'Levis',
    image: 'assets/images/two.jpg',
    quantity: 6,
    price: 100,
    desc: 'This is item description for Swagor',
  ),
  Items(
    name: 'Munchik',
    brand: 'Guess',
    image: 'assets/images/three.jpg',
    quantity: 6,
    price: 120,
    desc: 'This is item description for Munchik',
  ),
];

List<Map> buyshirts = [
  {
    'name': 'Polo v1',
    'brand': 'Polo Ralph',
    'image': 'assets/images/four.jpg',
    'price': '100'
  },
  {
    'name': 'Munchik',
    'brand': 'Guess',
    'image': 'assets/images/three.jpg',
    'price': '120'
  },
];

List<Map> icon = [
  {
    'name': 'Polo v1',
    'brand': 'Polo Ralph',
    'image': 'assets/images/61848.png'
  },
];

List<String> color = ['Black', 'White', 'Green', 'Orange'];

List<String> size = ['XS', 'S', 'M', 'L'];
