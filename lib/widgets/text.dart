import 'package:Kirana/customExports.dart';
import 'package:flutter/material.dart';

class TextLog extends StatelessWidget {
  final text;
  const TextLog({Key key, @required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: 70,
        color: ThemeKirana.white,
        fontFamily: 'Roboto-Bold',
      ),
    );
  }
}
