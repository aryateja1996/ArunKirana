import 'package:Kirana/customExports.dart';
import 'package:flutter/material.dart';

class Product extends StatefulWidget {
  final String src;
  Product({this.src});
  @override
  _ProductState createState() => _ProductState();
}

class _ProductState extends State<Product> {
  @override
  Widget build(BuildContext context) {
    DocumentReference reference =
        FirebaseFirestore.instance.collection('Products').doc(widget.src);
    return FutureBuilder(
      future: reference.get(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Error();
        }
        if (snapshot.connectionState == ConnectionState.done) {
          Map<String, dynamic> data = snapshot.data.data();
          // List<bool> availabilityOfPrice = List.from(data['priceAvailable']);
          List<int> priceList = List.from(data['prices']);
          List<double> discountList = (List.from(data['discount']));
          //  var disc = List<double>.from(discountList);
          print((discountList.runtimeType));
          return ProductPage(
            //description: data['description'],
            // availabilityByPrice: availabilityOfPrice,
            priceList: priceList,
            availability: data['available'],
            name: data['name'],
            imgUrl: data['imgUrl'],
            discount: discountList,
          );
        }
        return CircularProgressIndicator();
      },
    );
  }
}
