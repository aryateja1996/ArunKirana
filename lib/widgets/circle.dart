import 'package:flutter/material.dart';

import 'package:Kirana/Pages/helpSupport.dart';

class CircleButton extends StatefulWidget {
  final IconData icon;
  final double iconSize;

  const CircleButton({
    Key key,
    @required this.icon,
    @required this.iconSize,
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
        color: Colors.white,
        shape: BoxShape.circle,
      ),
      child: IconButton(
        icon: Icon(widget.icon),
        iconSize: widget.iconSize,
        color: Colors.black,
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
