import 'dart:ui';

import 'package:Kirana/theme.dart';
import 'package:flutter/material.dart';

class Button15 extends StatelessWidget {
  final text;

  const Button15({Key key, @required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      //color: ThemeKirana.black,
      //width: double.infinity - 100,
      height: 70,
      //alignment: Alignment(10, 10),
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.all(Radius.circular(50)),
        color: ThemeKirana.btn,
      ),
      child: Center(
        child: Text(
          text,
          style: TextStyle(
            color: ThemeKirana.white,
            fontSize: 45,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
