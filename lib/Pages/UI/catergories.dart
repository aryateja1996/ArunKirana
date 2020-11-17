import 'dart:typed_data';

import 'package:Kirana/customExports.dart';
import 'package:flutter/material.dart';

class ListCat extends StatefulWidget {
  final String src;
  ListCat({this.src});
  @override
  _ListCatState createState() => _ListCatState();
}

class _ListCatState extends State<ListCat> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.src),
      ),
      drawer: Drawerwig(),
      body: ListView.builder(
        itemCount: 11,
        itemBuilder: (BuildContext context, int index) {
          print(widget.src);
          print(index);
          return ImageBuilder(
            index: index,
            src: widget.src,
          );
        },
      ),
    );
  }
}

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
        height: 150,
        width: 180,
      );
    }
  }

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
            child: Text('data'),
            right: 0,
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
