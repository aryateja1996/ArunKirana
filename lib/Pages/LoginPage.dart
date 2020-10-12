import 'package:Kirana/theme.dart';
import 'package:Kirana/widgets/widgets.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          padding: EdgeInsets.fromLTRB(125, 150, 50, 50),
          color: ThemeKirana.page,
          child: Row(
            children: <Widget>[
              Column(
                children: [
                  CircleButton(
                    icon: Icons.help,
                    iconSize: 30.0,
                  ),
                ],
              ),
              Column(
                children: <Widget>[
                  Text(
                    "Login",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: ThemeKirana.white,
                      fontSize: 63,
                      fontWeight: FontWeight.w500,
                      fontFamily: 'Roboto',
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
