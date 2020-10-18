import 'package:Kirana/theme.dart';
import 'package:flutter/material.dart';

class Button15 extends StatefulWidget {
  final text;
  final click;

  const Button15({Key key, @required this.text, this.click});

  @override
  _Button15State createState() => _Button15State();
}

class _Button15State extends State<Button15> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        //color: ThemeKirana.black,
        //width: double.infinity - 100,
        height: 70,
        //alignment: Alignment(10, 10),
        decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.all(
            Radius.circular(50),
          ),
          color: ThemeKirana.btn,
        ),
        child: Center(
          child: Text(
            widget.text,
            style: TextStyle(
              color: ThemeKirana.white,
              fontSize: 45,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
      onTap: widget.click,
    );
  }
}
