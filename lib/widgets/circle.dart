import 'package:flutter/material.dart';

import 'package:Kirana/Pages/helpSupport.dart';

import '../theme.dart';

class CircleButton extends StatefulWidget {
  const CircleButton({
    Key key,
  }) : super(key: key);

  @override
  _CircleButtonState createState() => _CircleButtonState();
}

class _CircleButtonState extends State<CircleButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(6.0),
      decoration: BoxDecoration(
        color: ThemeKirana.page,
        shape: BoxShape.circle,
      ),
      child: IconButton(
        icon: Icon(Icons.help),
        iconSize: 30,
        color: ThemeKirana.white,
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => HelpSupport()),
          );
        },
      ),
    );
  }
}
