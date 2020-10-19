import 'package:Kirana/Pages/pages.dart';
import 'package:Kirana/theme.dart';
import 'package:flutter/material.dart';

class ChooseSignUp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ThemeKirana.page,
        elevation: 0,
        toolbarHeight: 50,
      ),
      backgroundColor: ThemeKirana.page,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Choose your method',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: ThemeKirana.white,
                letterSpacing: 2,
                wordSpacing: 1,
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 50),
              child: Column(
                children: [
                  SignInButtonBuilder(
                    backgroundColor: Colors.blueGrey[700],
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => ESignUp()),
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
                          builder: (context) => GSign(),
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
                          builder: (context) => FbSign(),
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
                        MaterialPageRoute(builder: (context) => PSign()),
                      );
                    },
                    icon: Icons.phone,
                    width: 220.0,
                    text: 'Use Phone',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
