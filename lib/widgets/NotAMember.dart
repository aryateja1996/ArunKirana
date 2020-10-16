import 'package:Kirana/theme.dart';
import 'package:flutter/material.dart';

class Not extends StatelessWidget {
  final msg;
  final text;
  final tap;

  const Not(
      {Key key, @required this.text, @required this.msg, @required this.tap});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 100,
      // color: ThemeKirana.white,
      padding: EdgeInsets.only(left: 85.5),
      child: Center(
        child: Container(
          //color: ThemeKirana.black,
          alignment: Alignment.bottomCenter,
          child: Row(
            children: [
              Text(msg),
              InkWell(
                child: Text(
                  text,
                  style: TextStyle(
                    color: ThemeKirana.link,
                    fontFamily: 'Times New Roman',
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                onTap: tap,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
