import 'package:flutter/material.dart';

class Categories extends StatefulWidget {
  @override
  _CategoriesState createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GridView.builder(
        gridDelegate:
            SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
        itemBuilder: (context, index) {
          return GridTile(
            child: Container(
              margin: EdgeInsets.all(10),
              color: Colors.cyanAccent,
              height: 150,
              width: 150,
              child: Center(child: Text('Loading Img')),
            ),
          );
        },
      ),
    );
  }
}
