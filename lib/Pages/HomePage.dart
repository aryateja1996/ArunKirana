import 'package:Kirana/widgets/Drawer.dart';
import 'package:flutter/material.dart';

import '../customExports.dart';

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
      drawer: Drawerwig(),
      appBar: AppBar(
        title: Text('Hello'),
        centerTitle: true,
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
        ],
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
