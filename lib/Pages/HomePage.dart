import 'dart:ui';

import 'package:Kirana/customExports.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:flutter/material.dart';

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
            MaterialPageRoute(
              builder: (context) => WelcomeScreen(),
            ),
            (Route<dynamic> rr) => false);
      });
    } else {
      User user = FirebaseAuth.instance.currentUser;
      FirebaseFirestore.instance.collection("user").doc(user.uid).get();
    }
  }

  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    firebase_storage.FirebaseStorage storage =
        firebase_storage.FirebaseStorage.instance;
    // ignore: unused_local_variable
    var ref = firebase_storage.FirebaseStorage.instance.ref();

    return Scaffold(
      drawer: Drawerwig(),
      appBar: AppBar(
        actions: [
          IconButton(
            icon: Icon(Icons.shopping_cart),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Cart(),
                ),
              );
            },
          ),
          IconButton(icon: Icon(Icons.search), onPressed: () {})
        ],
      ),
      body: Column(
        children: [
          Text(
            'MostPopular',
            style: TextStyle(
              fontSize: 50,
              color: ThemeKirana.page,
            ),
          ),
          MostPopular(),
          Text(
            'Categories',
            style: TextStyle(
              fontSize: 35,
              color: ThemeKirana.page,
            ),
          ),
          Categories(),
        ],
      ),
    );
  }
}
