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
          // Flexible(
          //   child: ListView.builder(
          //     scrollDirection: Axis.horizontal,
          //     itemBuilder: (contex, index) {
          //       return Container(
          //         height: 150,
          //         width: 150,
          //         color: Colors.cyanAccent,
          //       );
          //     },
          //   ),
          // ),
          SizedBox(
            width: 15,
          ),
          Container(
            height: 150,
            width: 150,
            color: Colors.white,
          ),
          SizedBox(
            width: 15,
          ),
          Container(
            height: 150,
            width: 150,
            color: Colors.white,
          ),
          SizedBox(
            width: 15,
          ),
          Container(
            height: 150,
            width: 150,
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
