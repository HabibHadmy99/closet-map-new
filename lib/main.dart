import 'package:closet_map/screen/admin/admin_home.dart';
import 'package:flutter/material.dart';

import 'screen/splash_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: AdminHomeScreen(),
    );
  }
}
