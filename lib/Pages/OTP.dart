import 'package:Kirana/theme.dart';
//import 'package:Kirana/widgets/Input_Fields.dart';
import 'package:flutter/material.dart';

class Otp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ThemeKirana.page,
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Otp1(),
                Otp1(),
                Otp1(),
                Otp1(),
                Otp1(),
                Otp1(),
              ],
            ),
            Row(
              children: [
                Text('help?'),
                Spacer(),
                Text('Resend Otp'),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class Otp1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 20,
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
        obscureText: true,
        keyboardType: TextInputType.number,
        style: TextStyle(
          color: ThemeKirana.white,
        ),
        decoration: InputDecoration(
          border: InputBorder.none,
          contentPadding: EdgeInsets.only(top: 14, left: 10),
        ),
      ),
    );
  }
}
