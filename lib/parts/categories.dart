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
    DocumentReference ref =
        FirebaseFirestore.instance.collection('details').doc('Categories');
    return Expanded(
      child: GridView.builder(
        itemCount: 27,
        gridDelegate:
            SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
        itemBuilder: (context, index) {
          return FutureBuilder(
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                Map<String, dynamic> data = snapshot.data.data();
                List<String> names = List.from(data['names']);
                // TODO
                //remove comments and to take item count of products
                //from firestore
                //List<int> itemCounts = List.from(data['itemCount']);
                //int passCount = itemCounts[index];
                return ItemGrid(
                  names: names,
                  index: index,
                  // passcount: passCount,
                );
              }
              return CircularProgressIndicator();
            },
            future: ref.get(),
          );
        },
      ),
    );
  }
}

class ItemGrid extends StatefulWidget {
  final int index;
  final List<String> names;
  final int passcount;
  ItemGrid({this.index, this.names, this.passcount});
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

  @override
  Widget build(BuildContext context) {
    return Container(
      child: InkWell(
        child: Column(
          children: [
            Container(
              width: 110,
              height: 110,
              child: GridTile(
                child: decideTile(),
              ),
            ),
            Text(
              widget.names[widget.index],
              style: TextStyle(
                fontSize: 15,
                color: Colors.black,
              ),
            ),
          ],
        ),
        onTap: () {
          print(widget.index);
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ListCat(
                src: widget.names[widget.index],
                itemCount: itemIndex[widget.index], // TODO widget.pass count,
              ),
            ),
          );
        },
      ),
      margin: EdgeInsets.all(8),
    );
  }
}
