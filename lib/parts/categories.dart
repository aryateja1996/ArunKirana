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
        itemCount: storeIndex.length,
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

  List<Color> color = [
    Colors.black, //0
    Colors.white, //1
    Colors.black, //2
    Colors.white, //3
    Colors.black, //4
    Colors.black, //5
    Colors.black, //6
    Colors.black, //7
    Colors.white, //8
    Colors.black, //9
    Colors.black, //10
    Colors.black, //11
    Colors.black, //12
    Colors.black, //13
    Colors.black, //14
    Colors.black, //15
    Colors.black, //16
    Colors.black, //17
    Colors.black, //18
    Colors.black, //19
    //
    // Colors.white,
    // Colors.black,
    // Colors.white,
    // Colors.black,
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
              fontSize: 20,
              color: color[colorIndex],
              backgroundColor: colorIndex == 4 ||
                      colorIndex == 5 ||
                      colorIndex == 18 ||
                      colorIndex == 17 ||
                      //colorIndex == 16 ||
                      colorIndex == 15 ||
                      colorIndex == 13 ||
                      colorIndex == 12 ||
                      colorIndex == 8
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
                itemCount: itemIndex[widget.index],
              ),
            ),
          );
        },
      ),
      margin: EdgeInsets.all(8),
    );
  }
}
