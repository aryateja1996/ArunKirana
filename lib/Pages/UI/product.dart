import 'package:Kirana/customExports.dart';
import 'package:flutter/material.dart';

class ProductPage extends StatefulWidget {
  final List<int> priceList;
  final bool availability;
  final String name;
  final String imgUrl;
  // final String description;
  final List<double> discount;
  ProductPage({
    this.priceList,
    this.availability,
    this.name,
    this.imgUrl,
    // this.description,
    this.discount,
  });
  @override
  _ProductPageState createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  double toSub = 0.0;
  int quantity = 1;
  double discountForThePrice = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: Drawerwig(),
      appBar: AppBar(
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
      body: Container(
        width: double.infinity,
        height: double.infinity,
        margin: EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(
              widget.imgUrl,
            ),
            Text(
              '${widget.name}',
              style: TextStyle(
                fontSize: 50,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            // Text(
            //   widget.description,
            //   style: TextStyle(
            //     fontSize: 20,
            //   ),
            // ),
            // SizedBox(
            //   height: 20,
            // ),
            Text(
              'Prices',
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            // SizedBox(
            //   height: 10,
            // ),
            Container(
              height: 80,
              width: double.infinity,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: widget.priceList.length,
                itemBuilder: (context, index) {
                  return FlatButton(
                    onPressed: () {
                      setState(
                        () {
                          toSub = (widget.priceList[index]).toDouble() -
                              (widget.discount[index]);

                          discountForThePrice = widget.discount[index];
                        },
                      );
                    },
                    child: Text(
                      'Rs ' + '${widget.priceList[index].toString()}' + '/-',
                      style: TextStyle(
                        fontSize: 15,
                      ),
                    ),
                  );
                },
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              //padding: EdgeInsets.only(right: 50),
              width: double.infinity,
              alignment: Alignment.centerRight,
              child: Row(
                children: [
                  Container(
                    // width: 250,
                    //height: 500,
                    child: Row(
                      children: [
                        Container(
                          child: Stack(
                            children: <Widget>[
                              Positioned(
                                child: IconButton(
                                  icon: Icon(Icons.minimize),
                                  onPressed: () {
                                    setState(
                                      () {
                                        quantity--;
                                      },
                                    );
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                        Text(quantity.toString()),
                        IconButton(
                          icon: Icon(
                            Icons.add,
                          ),
                          onPressed: () {
                            setState(() {
                              quantity++;
                            });
                          },
                        ),
                      ],
                    ),
                  ),
                  Text(
                    "You Save Rs ${discountForThePrice.toString()} /-",
                    style: TextStyle(
                      color: Colors.green[300],
                      fontSize: 15,
                    ),
                  ),
                  SizedBox(
                    width: 25,
                  ),
                  toSub == 0
                      ? Text(
                          '0',
                          style: TextStyle(
                            fontSize: 15,
                          ),
                        )
                      : Text(
                          'Rs ' + '${toSub.toString()}' + '/-',
                          style: TextStyle(
                            fontSize: 15,
                          ),
                        ),
                ],
              ),
            ),
            SizedBox(
              height: 90,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(
                    color: ThemeKirana.white,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                      width: 1.5,
                      color: ThemeKirana.bigButton,
                    ),
                  ),
                  child: FlatButton(
                    child: Icon(Icons.favorite),
                    onPressed: () {},
                  ),
                ),
                SizedBox(
                  width: 30,
                ),
                Container(
                  width: 250,
                  decoration: BoxDecoration(
                    color: ThemeKirana.page,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                      width: 1.5,
                      color: ThemeKirana.bigButton,
                    ),
                  ),
                  child: FlatButton(
                    child: Text('Add To Cart'),
                    onPressed: () {
                      setState(() {
                        var snackBar = SnackBar(
                          content: Container(
                            color: ThemeKirana.page,
                            child: Row(
                              children: [
                                Icon(
                                  Icons.thumb_up,
                                  color: Colors.blue,
                                ),
                                SizedBox(
                                  width: 15,
                                ),
                                Text('Added to Cart'),
                              ],
                            ),
                          ),
                        );
                        _scaffoldKey.currentState.showSnackBar(snackBar);
                      });
                    },
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
