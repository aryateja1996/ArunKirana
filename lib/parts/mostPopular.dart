import 'package:flutter/material.dart';

class MostPopular extends StatefulWidget {
  @override
  _MostPopularState createState() => _MostPopularState();
}

class _MostPopularState extends State<MostPopular> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Row(
        children: <Widget>[
          SizedBox(
            width: 10,
          ),
          Container(
            height: 100,
            width: 100,
            color: Colors.white,
          ),
          SizedBox(
            width: 10,
          ),
          Container(
            height: 100,
            width: 100,
            color: Colors.white,
          ),
          SizedBox(
            width: 10,
          ),
          Container(
            height: 100,
            width: 100,
            child: Center(
                child: Icon(
              Icons.navigate_next,
              size: 50,
            )),
          ),
        ],
      ),
    );
  }
}
