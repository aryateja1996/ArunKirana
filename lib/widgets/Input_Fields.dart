import 'package:Kirana/theme.dart';
import 'package:flutter/material.dart';

class InputFields extends StatefulWidget {
  final encrypto;
  final hint;
  final type;
  final fun;
  final valid;

  const InputFields(
      {Key key,
      this.encrypto,
      this.hint,
      this.type,
      @required this.fun,
      this.valid});

  @override
  _InputFieldsState createState() => _InputFieldsState();
}

class _InputFieldsState extends State<InputFields> {
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
          child: TextFormField(
            obscureText: widget.encrypto,
            keyboardType: widget.type,
            style: TextStyle(
              color: ThemeKirana.white,
            ),
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(top: 14, left: 10),
              hintText: widget.hint,
              hintStyle: TextStyle(
                color: ThemeKirana.white,
                fontSize: 18,
              ),
            ),
            onSaved: widget.fun,
            validator: widget.valid,
          ),
        ),
      ],
    );
  }
}
