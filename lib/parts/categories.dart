import 'dart:typed_data';

import 'package:Kirana/customExports.dart';

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
        itemCount: 25,
        gridDelegate:
            SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
        itemBuilder: (context, index) {
          return ItemGrid(index: index);
        },
      ),
    );
  }
}

class ItemGrid extends StatefulWidget {
  final int index;
  ItemGrid({this.index});
  @override
  _ItemGridState createState() => _ItemGridState();
}

class _ItemGridState extends State<ItemGrid> {
  StorageReference refImg = FirebaseStorage.instance.ref().child('categories');
  int maxSize = 10 * 1024 * 1024;
  Uint8List imgFile;
  getImage() {
    refImg.child('${widget.index}.jpeg').getData(maxSize).then((data) {
      this.setState(() {
        imgFile = data;
      });
    });
  }

  @override
  void initState() {
    super.initState();
    getImage();
  }

  Widget decideTile() {
    if (imgFile == null) {
      return Center(
        child: CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation<Color>(
            ThemeKirana.page,
          ),
        ),
      );
    } else {
      return Image.memory(
        imgFile,
        fit: BoxFit.cover,
      );
    }
  }

  List<String> storeIndex = [
    "Biscuits",
    "Flours",
    "Sugars",
    "Oils",
    "Detergents",
    "Cereals",
    "Dry Fruits",
    "",
    "",
    "",
    "",
    "",
    "",
    "",
    "",
    "",
    "",
    "",
    "",
    "",
    "",
    "",
    "",
    "",
    "",
  ];
  List<Color> color = [
    Colors.black,
    Colors.white,
    Colors.black,
    Colors.white,
    Colors.black,
    //
    Colors.black,
    //
    Colors.black,
    Colors.white,
    Colors.black,
    Colors.white,
    Colors.black,
    Colors.white,
    Colors.black,
    Colors.white,
    Colors.black,
    Colors.white,
    Colors.black,
    Colors.white,
    Colors.black,
    Colors.white,
    Colors.black,
    Colors.white,
    Colors.black,
    Colors.white,
    Colors.black,
  ];

  @override
  Widget build(BuildContext context) {
    int colorIndex = widget.index;
    return Container(
      child: InkWell(
        child: GridTile(
          child: decideTile(),
          header: Text(
            storeIndex[widget.index],
            style: TextStyle(
              color: color[colorIndex],
              backgroundColor: colorIndex == 4 || colorIndex == 5
                  ? color[1]
                  : Colors.transparent,
            ),
          ),
        ),
        onTap: () {
          print(widget.index);
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ListCat(
                src: storeIndex[widget.index],
              ),
            ),
          );
        },
      ),
      margin: EdgeInsets.all(8),
    );
  }
}
