import 'package:Kirana/Pages/pages.dart';
import 'package:Kirana/theme.dart';
import 'package:flutter/material.dart';

import '../firebase.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    super.initState();
    User firebaseUser = FirebaseAuth.instance.currentUser;
    if (firebaseUser == null) {
      Future.delayed(Duration.zero, () {
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => WelcomeScreen()),
            (Route<dynamic> rr) => false);
      });
    } else {}
  }

  Widget build(BuildContext context) {
    User user = FirebaseAuth.instance.currentUser;
    return Scaffold(
      backgroundColor: ThemeKirana.page,
      appBar: AppBar(
        title: Text('${user.phoneNumber}'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            RaisedButton(
              onPressed: () {
                FirebaseAuth.instance.signOut();
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                      builder: (context) => WelcomeScreen(),
                    ),
                    (Route<dynamic> rr) => false);
              },
              child: Text('Sign Out'),
            ),
            //Text('Details'),
          ],
        ),
      ),
    );
  }
}
