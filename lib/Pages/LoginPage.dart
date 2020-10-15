import 'dart:ui';
//import 'textFields.dart';
import 'package:Kirana/export.dart';
import 'package:Kirana/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ThemeKirana.page,
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: Stack(
          children: [
            Container(
              height: double.infinity,
              width: double.infinity,
              child: SingleChildScrollView(
                physics: AlwaysScrollableScrollPhysics(),
                padding: EdgeInsets.symmetric(horizontal: 25, vertical: 120),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextLog(text: 'Login'),
                    SizedBox(height: 50),
                    _Email(),
                    _Password(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

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
          margin: EdgeInsets.fromLTRB(10, 0, 10, 10),
          decoration: BoxDecoration(
            color: ThemeKirana.page,
            borderRadius: BorderRadius.circular(10),
          ),
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
                color: ThemeKirana.black,
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
            color: ThemeKirana.page,
            borderRadius: BorderRadius.circular(10),
          ),
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
                Icons.panorama_fish_eye,
                color: ThemeKirana.black,
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