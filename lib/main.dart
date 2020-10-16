import 'package:Kirana/Pages/pages.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(Kirana());
}

class Kirana extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Times New Roman',
        primaryColor: Colors.white,
        accentColor: Colors.white,
      ),
      home: SignUp(),
    );
  }
}
