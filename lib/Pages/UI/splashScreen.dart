import 'dart:async';

import 'package:Kirana/customExports.dart';
import 'package:flutter/material.dart';

class Splash extends StatefulWidget {
  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    Timer(
      Duration(seconds: 3),
      () {
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
              builder: (context) => Home(),
            ),
            (route) => false);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: ThemeKirana.page,
      body: Stack(
        children: [
          Center(
            child: Text(
              'Arun Kirana',
              style: TextStyle(
                fontSize: 50,
                color: ThemeKirana.white,
              ),
            ),
          ),
          new Positioned(
            child: Center(
              child: CircularProgressIndicator(
                strokeWidth: 5,
              ),
            ),
            bottom: 10,
            width: width,
            height: 100,
          )
        ],
      ),
    );
  }
}
