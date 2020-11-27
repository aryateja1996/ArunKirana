import 'package:Kirana/customExports.dart';
import 'package:flutter/material.dart';

class MostPopular extends StatelessWidget {
  Widget build(BuildContext context) {
    CollectionReference ref = FirebaseFirestore.instance.collection('details');

    return FutureBuilder(
        future: ref.doc('offerBanner').get(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            Map<String, dynamic> data = snapshot.data.data();
            String imgUrl = data['imgUrl'];
            bool available = data['available'];
            if (available) {
              return Container(
                child: imgUrl == null
                    ? null
                    : Image.network(
                        imgUrl,
                        fit: BoxFit.fill,
                      ),
              );
            }
            return Container(
              width: 0.0,
              height: 0.0,
            );
          }
          return Container(
            width: 0.0,
            height: 0.0,
          );
        });
  }
}
