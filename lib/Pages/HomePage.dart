import 'package:Kirana/customExports.dart';
import 'package:Kirana/widgets/Drawer.dart';
import 'package:firebase_storage/firebase_storage.dart';
// import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;  
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
            MaterialPageRoute(builder: (context) => WelcomeScreen()),
            (Route<dynamic> rr) => false);
      });
    } else {
      User user = FirebaseAuth.instance.currentUser;
      FirebaseFirestore.instance.collection("user").doc(user.uid).get();
    }
  }

  Widget build(BuildContext context) {
// ignore: unused_local_variable
FirebaseStorage storage = FirebaseStorage.instance;
   

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
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                children: [
                  
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

}
