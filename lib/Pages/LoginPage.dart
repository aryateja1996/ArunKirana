import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        actions: <Widget>[
          IconButton(
              icon: Icon(
                Icons.help,
                color: Colors.white,
              ),
              onPressed: null)
        ],
      ),
      body: Container(
        color: Colors.pink,
        child: Row(
          children: [
            Text(
              "Login",
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
