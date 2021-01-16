import 'package:closet_map/screen/admin/admin_home.dart';
import 'package:closet_map/screen/profile.dart';
import 'package:flutter/material.dart';
import 'dependencies.dart' as di;
import 'screen/splash_screen.dart';

void main() {
  di.init();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}
