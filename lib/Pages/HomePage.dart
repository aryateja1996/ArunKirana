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
    // ignore: unused_local_variable
    User user = FirebaseAuth.instance.currentUser;
    return Scaffold(
      backgroundColor: ThemeKirana.page,
      drawer: Drawer(
        child: Scaffold(
          backgroundColor: ThemeKirana.bars,
          body: Container(
            width: double.infinity,
            height: double.infinity,
            child: Column(
              children: [
                Container(
                  width: double.infinity,
                  height: 300,
                  color: ThemeKirana.white,
                )
              ],
            ),
          ),
        ),
      ),
      appBar: AppBar(
        title: Text('Hello'),
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
