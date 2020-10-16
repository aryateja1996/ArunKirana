import 'package:Kirana/Pages/pages.dart';
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
      appBar: AppBar(
        backgroundColor: ThemeKirana.page,
        elevation: 0,
        actions: [
          CircleButton(),
        ],
      ),
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
                    InputFields(
                      encrypto: false,
                      hint: 'Phone',
                    ),
                    InputFields(
                      encrypto: true,
                      hint: 'Password',
                    ),
                    Button15(text: 'Login'),
                    Not(
                      text: 'SIGN UP',
                      msg: 'Not a Member ?  ',
                      tap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => SignUp()),
                        );
                      },
                    )
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
