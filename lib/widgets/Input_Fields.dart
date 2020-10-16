import 'package:Kirana/theme.dart';
import 'package:flutter/material.dart';

class InputFields extends StatelessWidget {
  final encrypto;
  final hint;
  final type;

  const InputFields({Key key, this.encrypto, this.hint, this.type});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 10),
        Container(
          alignment: Alignment.centerLeft,
          margin: EdgeInsets.fromLTRB(10, 0, 10, 30),
          decoration: BoxDecoration(
            color: ThemeKirana.page,
            border: Border(
              top: BorderSide(width: 0.0, color: ThemeKirana.page),
              right: BorderSide(width: 0.0, color: ThemeKirana.page),
              bottom: BorderSide(width: 2.5, color: ThemeKirana.white),
              left: BorderSide(width: 0.0, color: ThemeKirana.page),
            ),
          ),
          height: 60,
          child: TextField(
            obscureText: encrypto,
            keyboardType: type,
            style: TextStyle(
              color: ThemeKirana.white,
            ),
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(top: 14),
              hintText: hint,
              hintStyle: TextStyle(
                color: ThemeKirana.white,
                fontSize: 18,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
