import 'package:Kirana/firebase.dart';
import 'package:Kirana/theme.dart';
import 'package:Kirana/widgets/icons.dart';
import 'package:flutter/material.dart';

class Drawerwig extends StatelessWidget {
  final User user = FirebaseAuth.instance.currentUser;
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Scaffold(
        backgroundColor: ThemeKirana.bars,
        body: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            Container(
              height: 500,
              child: DrawerHeader(
                child: Column(
                  children: <Widget>[
                    Image(
                      image: NetworkImage(
                        'https://1.bp.blogspot.com/-MdaQwrpT4Gs/Xdt-ff_hxEI/AAAAAAAAQXE/oOgnysGd9LwoFLMHJ0etngKzXxmQkWc5ACLcBGAsYHQ/s400/Beautiful-Backgrounds%2B%2528122%2529.jpg',
                      ),
                      height: 100,
                      width: 100,
                    ),
                    Text('Name: ' + '${user.displayName}')
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
            SizedBox(height: 20),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Icon(MyIcons.wtsup),
                Divider(),
                Icon(Icons.cloud_circle),
                Divider(
                  thickness: 100,
                  color: ThemeKirana.black,
                ),
                Icon(Icons.cloud_circle),
              ],
            )
          ],
        ),
      ),
    );
  }
}
