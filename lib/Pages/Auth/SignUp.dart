import 'package:Kirana/Pages/pages.dart';
import 'package:Kirana/theme.dart';
import 'package:Kirana/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SignUp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          CircleButton(),
        ],
        elevation: 0,
        backgroundColor: ThemeKirana.page,
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
                child: Column(
                  children: [
                    TextLog(text: 'Sign Up'),
                    SizedBox(height: 50),
                    InputFields(
                      encrypto: false,
                      hint: 'Name',
                      type: TextInputType.name,
                    ),
                    InputFields(
                      encrypto: false,
                      hint: 'Mobile',
                      type: TextInputType.number,
                    ),
                    address(),
                    Button15(text: 'SIGN UP'),
                    Not(
                      text: 'LOGIN',
                      msg: 'Already a Member ? ',
                      tap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => LoginPage()),
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

Widget address() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      SizedBox(height: 10),
      Container(
        alignment: Alignment.centerLeft,
        margin: EdgeInsets.fromLTRB(10, 0, 10, 30),
        decoration: BoxDecoration(
          color: ThemeKirana.page,
        ),
        height: 60,
        child: TextField(
          obscureText: false,
          keyboardType: TextInputType.multiline,
          maxLines: 3,
          style: TextStyle(
            color: ThemeKirana.white,
          ),
          decoration: InputDecoration(
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(width: 2.50, color: ThemeKirana.white),
            ),
            contentPadding: EdgeInsets.only(top: 14, left: 10),
            hintText: 'Address',
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
