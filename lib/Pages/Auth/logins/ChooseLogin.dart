import 'package:Kirana/Pages/pages.dart';
import 'package:Kirana/theme.dart';
import 'package:flutter/material.dart';

class ChooseLogin extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ThemeKirana.page,
        elevation: 0,
        toolbarHeight: 20,
      ),
      backgroundColor: ThemeKirana.page,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SignInButtonBuilder(
              backgroundColor: Colors.blueGrey[700],
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => EmailLoginPage()),
                );
              },
              icon: Icons.email,
              width: 220.0,
              text: 'Get Going With Email',
            ),
            Divider(),
            SignInButton(
              Buttons.Google,
              text: 'Use Google',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Glog(),
                  ),
                );
              },
            ),
            Divider(),
            SignInButton(
              Buttons.FacebookNew,
              text: 'Use Facebook',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => FbLog(),
                  ),
                );
              },
            ),
            Divider(),
            SignInButtonBuilder(
              backgroundColor: Colors.blueGrey[700],
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => PhoneLogin()),
                );
              },
              icon: Icons.phone,
              width: 220.0,
              text: 'Use Phone',
            ),
          ],
        ),
      ),
    );
  }
}
