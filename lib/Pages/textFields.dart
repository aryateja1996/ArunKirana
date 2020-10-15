import 'package:Kirana/export.dart';
import 'package:flutter/material.dart';

Widget _Email() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        'Phone',
        style: TextStyle(
          color: ThemeKirana.white,
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
      ),
      SizedBox(height: 10),
      Container(
          alignment: Alignment.centerLeft,
          margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
          decoration: BoxDecoration(
              color: ThemeKirana.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                    color: ThemeKirana.black,
                    blurRadius: 6,
                    offset: Offset(0, 2))
              ]),
          height: 60,
          child: TextField(
            keyboardType: TextInputType.phone,
            style: TextStyle(
              color: ThemeKirana.black,
            ),
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(top: 14),
              prefixIcon: Icon(
                Icons.phone,
                color: ThemeKirana.page,
              ),
              hintText: 'Phone',
              hintStyle: TextStyle(
                color: ThemeKirana.black,
              ),
            ),
          )),
    ],
  );
}

Widget _Password() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        'Password',
        style: TextStyle(
          color: ThemeKirana.white,
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
      ),
      SizedBox(height: 10),
      Container(
          alignment: Alignment.centerLeft,
          margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
          decoration: BoxDecoration(
              color: ThemeKirana.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                    color: ThemeKirana.black,
                    blurRadius: 6,
                    offset: Offset(0, 2))
              ]),
          height: 60,
          child: TextField(
            obscureText: true,
            style: TextStyle(
              color: ThemeKirana.black,
            ),
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(top: 14),
              prefixIcon: Icon(
                Icons.phone,
                color: ThemeKirana.page,
              ),
              hintText: 'Password',
              hintStyle: TextStyle(
                color: ThemeKirana.black,
              ),
            ),
          )),
    ],
  );
}
