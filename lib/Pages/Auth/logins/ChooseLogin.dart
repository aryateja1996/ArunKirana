import 'package:Kirana/customExports.dart';
import 'package:flutter/material.dart';

class ChooseLogin extends StatefulWidget {
  @override
  _ChooseLoginState createState() => _ChooseLoginState();
}

class _ChooseLoginState extends State<ChooseLogin> {
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
                        MaterialPageRoute(
                            builder: (context) => EmailLoginPage()),
                      );
                    },
                    icon: Icons.email,
                    width: 220.0,
                    text: 'Get Going With Email',
                  ),
                  // Divider(),
                  // SignInButton(
                  //   Buttons.Google,
                  //   text: 'Use Google',
                  //   onPressed: () {
                  //     googleSignIn();
                  //   },
                  // ),
                  // Divider(),
                  // SignInButton(
                  //   Buttons.FacebookNew,
                  //   text: 'Use Facebook',
                  //   onPressed: signInWithFacebook,
                  // ),
                  Divider(),
                  SignInButtonBuilder(
                    backgroundColor: Colors.blueGrey[700],
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => PhoneLogin(),
                        ),
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

  // ignore: missing_return
  Future<UserCredential> signInWithFacebook() async {
    // Trigger the sign-in flow
    final LoginResult result = await FacebookAuth.instance.login();

    // Create a credential from the access token
    final FacebookAuthCredential facebookAuthCredential =
        FacebookAuthProvider.credential(result.accessToken.token);

    // Once signed in, return the UserCredential

    FirebaseAuth.instance.signInWithCredential(facebookAuthCredential);

    User user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
            builder: (context) => Home(),
          ),
          (route) => false);
    } else {
      // user is not logged in
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
            builder: (context) => ChooseLogin(),
          ),
          (route) => false);
    }
  }
}
