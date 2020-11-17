import 'package:flutter/material.dart';
import 'package:Kirana/customExports.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(Kirana());
}

class Kirana extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      // Initialize FlutterFire
      future: Firebase.initializeApp(
        options: FirebaseOptions(
            appId: '1:605552956090:android:30a84098716101e634e883',
            apiKey: 'AIzaSyCUiP8fai99gxoUXTpcgyh9DFsyK-j0uos',
            authDomain: 'kirana-app-292806.firebaseapp.com',
            storageBucket: 'gs://kirana-app-292806.appspot.com',
            projectId: 'kirana-app-292806',
            messagingSenderId: '605552956090',
            databaseURL: 'https://kirana-app-292806.firebaseio.com/'),
      ),
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
            home: Splash(),
          );
        }

        // Otherwise, show something whilst waiting for initialization to complete
        return Loading();
      },
    );
  }
}
