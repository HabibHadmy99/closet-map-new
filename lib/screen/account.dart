import 'package:flutter/material.dart';

import 'home.dart';

class AccountScreen extends StatelessWidget {
  static Route<dynamic> route() =>
      MaterialPageRoute(builder: (_) => AccountScreen());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Text(
        'Kat Sini User Setting',
      ),
    );
  }
}
