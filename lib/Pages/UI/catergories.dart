import 'dart:typed_data';

import 'package:Kirana/customExports.dart';
import 'package:flutter/material.dart';

class ListCat extends StatefulWidget {
  final String src;
  final int itemCount;
  ListCat({this.src, this.itemCount});
  @override
  _ListCatState createState() => _ListCatState();
}

class _ListCatState extends State<ListCat> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.src),
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
          IconButton(icon: Icon(Icons.search), onPressed: () {})
        ],
      ),
      drawer: Drawerwig(),
      body: widget.itemCount == 0
          ? Center(
              child: Text('No Items Here Comning Soon'),
            )
          : widget.src == 'Spices'
              ? Text('data')
              : ListView.builder(
                  itemCount: widget.src == 'Tooth paste & Tooth Brushes'
                      ? 11
                      : widget.itemCount,
                  itemBuilder: (BuildContext context, int index) {
                    //print(widget.src);
                    //print(index);
                    return ImageBuilder(
                      index: index,
                      src: widget.src,
                    );
                  },
                ),
    );
  }
}

//

class ImageBuilder extends StatefulWidget {
  final String src;
  final int index;

  ImageBuilder({this.index, this.src});
  @override
  _ImageBuilderState createState() => _ImageBuilderState(src: src);
}

class _ImageBuilderState extends State<ImageBuilder> {
  final String src;
  _ImageBuilderState({this.src});

  StorageReference refImg = FirebaseStorage.instance.ref().child('images');

  int maxSize = 10 * 1024 * 1024;
  Uint8List imgFile;
  getImage() {
    refImg
        .child(widget.src)
        .child('${widget.index}.jpg')
        .getData(maxSize)
        .then((data) {
      this.setState(() {
        imgFile = data;
      });
    });
    print(widget.src);
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
        fit: BoxFit.contain,
        height: 100,
        width: 180,
      );
    }
  }

  List<String> productDescription = [
    'Bourbon',
    'Dark Fantasy',
    'GoodDayKaju',
    'GoodDayCashew',
    'HappyHappy',
    'Hide&Seek',
    'KrackJack',
    'MarieGold',
    'Monaco',
    'OreoVanilla',
    'Parle-G',
    'Bourbon',
    'Dark Fantasy',
    'GoodDayKaju',
    'GoodDayCashew',
    'HappyHappy',
    'Hide&Seek',
    'KrackJack',
    'MarieGold',
    'Monaco',
    'OreoVanilla',
    'Parle-G',
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: double.infinity,
      margin: EdgeInsets.all(8.0),
      child: Stack(
        children: [
          Positioned(
            child: decideTile(),
            left: 0,
          ),
          Positioned(
            left: 200,
            top: 50,
            child: Container(
              width: 100,
              child: Text(
                productDescription[widget.index],
              ),
            ),
          ),
          Container(
            alignment: Alignment.centerRight,
            child: FlatButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Product(
                      src: productDescription[widget.index],
                    ),
                  ),
                );
              },
              child: Text('View \nProduct'),
            ),
          ),
        ],
      ),
      decoration: BoxDecoration(
          border: Border.all(
        style: BorderStyle.solid,
        color: Colors.blueGrey,
        width: 1.0,
      )),
    );
  }
}
