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
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => WelcomeScreen()),
          (Route<dynamic> rr) => false);
    } else {
      // User logged
    }
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ThemeKirana.page,
      appBar: AppBar(
        title: Text('Home'),
        centerTitle: true,
      ),
      body: Center(
        child: Text('This is home page'),
      ),
    );
  }
}
