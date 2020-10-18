import 'package:Kirana/Pages/pages.dart';
import 'package:flutter/material.dart';
import 'package:Kirana/firebase.dart';

void main() {
  runApp(Kirana());
}

class Kirana extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      // Initialize FlutterFire
      future: Firebase.initializeApp(),
      builder: (context, snapshot) {
        // Check for errors
        if (snapshot.hasError) {
          return Error();
        }

        // Once complete, show your application
        if (snapshot.connectionState == ConnectionState.done) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              fontFamily: 'Times New Roman',
              primaryColor: Colors.white,
              accentColor: Colors.white,
            ),
            home: Home(),
          );
        }

        // Otherwise, show something whilst waiting for initialization to complete
        return Loading();
      },
    );
  }
}
