import 'package:flutter/material.dart';
import 'Pages/LoginPage.dart';

void main() {
  runApp(Kirana());
}

class Kirana extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        fontFamily: 'Roboto',
        primaryColor: Colors.pink,
        accentColor: Colors.white,
      ),
      home: LoginPage(),
    );
  }
}
