import 'package:Kirana/customExports.dart';
import 'package:flutter/material.dart';

class WelcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ThemeKirana.page,
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '\nWelcome\n',
              style: TextStyle(
                fontSize: 50,
                fontWeight: FontWeight.bold,
                color: ThemeKirana.white,
                letterSpacing: 5,
                wordSpacing: 1,
              ),
            ),
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: ThemeKirana.white,
                shape: BoxShape.circle,
              ),
              alignment: Alignment.center,
              // margin: EdgeInsets.fromLTRB(0, 200, 0, 0),
              child: RaisedButton(
                child: Text(
                  'Login',
                  style: TextStyle(
                    color: ThemeKirana.link,
                    fontSize: 20,
                  ),
                ),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ChooseLogin(),
                      ));
                },
                color: ThemeKirana.page,
                hoverColor: ThemeKirana.bars,
                elevation: 0,
              ),
            ),
            Container(
              width: double.infinity,
              alignment: Alignment.center,
              margin: EdgeInsets.symmetric(vertical: 50),
              decoration: BoxDecoration(
                color: ThemeKirana.white,
                shape: BoxShape.circle,
              ),
              child: RaisedButton(
                child: Text(
                  'SignUp',
                  style: TextStyle(
                    color: ThemeKirana.link,
                    fontSize: 20,
                  ),
                ),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ChooseSignUp(),
                      ));
                },
                color: ThemeKirana.page,
                hoverColor: ThemeKirana.bars,
                elevation: 0,
              ),
            ),
            Container(
              //color: ThemeKirana.white,
              width: double.infinity,
              height: 100,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Need any Help?\t'),
                  InkWell(
                    child: Text(
                      'Contact',
                      style: TextStyle(
                        color: ThemeKirana.link,
                        fontSize: 25,
                      ),
                    ),
                    onTap: null,
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
