import 'package:Kirana/customExports.dart';
import 'package:flutter/material.dart';

class Drawerwig extends StatefulWidget {
  @override
  _DrawerwigState createState() => _DrawerwigState();
}

class _DrawerwigState extends State<Drawerwig> {
  final User user = FirebaseAuth.instance.currentUser;
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    CollectionReference users = FirebaseFirestore.instance.collection("user");
    return FutureBuilder<DocumentSnapshot>(
        future: users.doc(user.uid).get(),
        builder:
            (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: Text("Some error occurred"),
            );
          }
          if(snapshot.connectionState == ConnectionState.done){
            Map<String, dynamic> data = snapshot.data.data();
              return Drawer(
              child: Scaffold(
                backgroundColor: ThemeKirana.bars,
                body: ListView(
                  padding: EdgeInsets.zero,
                  children: <Widget>[
                    Container(
                      height: height *0.5,
                      child: DrawerHeader(
                        child: Column(
                          children: <Widget>[
                            Text('Name: ' + "${data['username']}")
                          ],
                        ),
                        decoration: BoxDecoration(
                          color: Colors.blue,
                        ),
                      ),
                    ),
                    ListTile(
                      title: Text(
                        'Home',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      onTap: () {
                        // Update the state of the app.
                        // ...
                      },
                    ),
                    ListTile(
                      title: Text(
                        'Order',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      onTap: () {
                        // Update the state of the app.
                        // ...
                      },
                    ),
                    ListTile(
                      title: Text(
                        'Support',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      onTap: () {
                        // Update the state of the app.
                        // ...
                      },
                    ),
                    ListTile(
                      title: Text(
                        'Terms & Conditions',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      onTap: () {
                        // Update the state of the app.
                        // ...
                      },
                    ),
                    ListTile(
                      title: Text(
                        'Policies',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      onTap: () {
                        // Update the state of the app.
                        // ...
                      },
                    ),
                    ListTile(
                      title: Text(
                        'About',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      onTap: () {
                        // Update the state of the app.
                        // ...
                      },
                    ),
                    SizedBox(height: 10),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Icon(Icons.message),
                        Icon(Icons.cloud_circle),
                        Icon(Icons.cloud_circle),
                        SizedBox(height: 15)
                      ],
                    )
                  ],
                ),
              ),
            );
          }
          return Text('loading...');
        },);
  }
}
