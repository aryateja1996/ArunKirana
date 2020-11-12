import 'package:Kirana/customExports.dart';

import 'package:flutter/material.dart';

// ignore: must_be_immutable
class PSign extends StatefulWidget {
  String name;
  PSign({@required this.name});
  @override
  _PSignState createState() => _PSignState();
}

class _PSignState extends State<PSign> {
  final _phoneController = TextEditingController();
  final _nameController = TextEditingController();
  final _codeController = TextEditingController();
  final _addController = TextEditingController();

  Future<bool> signUpUser(
      String phone, BuildContext context, String name, String add) async {
    FirebaseAuth _auth = FirebaseAuth.instance;

    _auth.verifyPhoneNumber(
      phoneNumber: phone,
      timeout: Duration(seconds: 60),
      verificationCompleted: (AuthCredential credential) async {
        Navigator.of(context).pop();

        await _auth.signInWithCredential(credential);
        User user = _auth.currentUser;
        if (user != null) {
          var trail =
              FirebaseFirestore.instance.collection("user").doc(user.uid);
          print(trail);
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => Home()));
        } else {
          print("Error");
        }

        //This callback would gets called when verification is done auto maticlly
      },
      verificationFailed: (FirebaseAuthException exception) {
        print(exception);
      },
      codeSent: (String verificationId, [int forceResendingToken]) {
        showDialog(
            context: context,
            barrierDismissible: false,
            builder: (context) {
              return AlertDialog(
                title: Text("Give the code?"),
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    TextField(
                      controller: _codeController,
                    ),
                  ],
                ),
                actions: <Widget>[
                  FlatButton(
                    child: Text("Confirm"),
                    textColor: ThemeKirana.bars,
                    color: ThemeKirana.btn,
                    onPressed: () async {
                      final code = _codeController.text.trim();
                      AuthCredential credential = PhoneAuthProvider.credential(
                          verificationId: verificationId, smsCode: code);

                      await _auth.signInWithCredential(credential);

                      User user = FirebaseAuth.instance.currentUser;

                      if (user != null) {
                        Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Home(),
                            ),
                            (route) => false);
                      } else {
                        print("Error");
                      }
                    },
                  )
                ],
              );
            });
      },
      codeAutoRetrievalTimeout: (String verificationId) {},
    );
    if (_auth.currentUser != null) {
      return true;
    } else {
      return false;
    }
  }

  // keytool -list -v \-alias androiddebugkey -keystore aryat\.android\debug.keystore
  Future<bool> loginUser(
    String phone,
    BuildContext context,
  ) async {
    FirebaseAuth _auth = FirebaseAuth.instance;

    _auth.verifyPhoneNumber(
      phoneNumber: phone,
      timeout: Duration(seconds: 60),
      verificationCompleted: (AuthCredential credential) async {
        Navigator.of(context).pop();

        await _auth.signInWithCredential(credential);
        User user = _auth.currentUser;
        if (user != null) {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => Home()));
        } else {
          print("Error");
        }

        //This callback would gets called when verification is done auto maticlly
      },
      verificationFailed: (FirebaseAuthException exception) {
        print(exception);
      },
      codeSent: (String verificationId, [int forceResendingToken]) {
        showDialog(
            context: context,
            barrierDismissible: false,
            builder: (context) {
              return AlertDialog(
                title: Text("Give the code?"),
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    TextField(
                      controller: _codeController,
                    ),
                  ],
                ),
                actions: <Widget>[
                  FlatButton(
                    child: Text("Confirm"),
                    textColor: ThemeKirana.bars,
                    color: ThemeKirana.btn,
                    onPressed: () async {
                      final code = _codeController.text.trim();
                      AuthCredential credential = PhoneAuthProvider.credential(
                          verificationId: verificationId, smsCode: code);

                      await _auth.signInWithCredential(credential);

                      User user = FirebaseAuth.instance.currentUser;

                      if (user != null) {
                        Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Home(),
                            ),
                            (route) => false);
                      } else {
                        print("Error");
                      }
                    },
                  )
                ],
              );
            });
      },
      codeAutoRetrievalTimeout: (String verificationId) {},
    );
    if (_auth.currentUser != null) {
      return true;
    } else {
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    if (widget.name == 'Login') {
      return Scaffold(
        appBar: AppBar(),
        backgroundColor: ThemeKirana.page,
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(32),
            child: Form(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    widget.name,
                    style: TextStyle(
                        color: Colors.lightBlue,
                        fontSize: 36,
                        fontWeight: FontWeight.w500),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(8)),
                            borderSide: BorderSide(color: Colors.grey[200])),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(8)),
                            borderSide: BorderSide(color: Colors.grey[300])),
                        filled: true,
                        fillColor: Colors.grey[100],
                        hintText: "Mobile Number"),
                    controller: _phoneController,
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  Container(
                    width: double.infinity,
                    child: FlatButton(
                      child: Text("LOGIN"),
                      textColor: Colors.white,
                      padding: EdgeInsets.all(16),
                      onPressed: () {
                        final phone = '+91' + (_phoneController.text.trim());

                        loginUser(phone, context);
                      },
                      color: Colors.blue,
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      );
    } else {
      return Scaffold(
        appBar: AppBar(),
        backgroundColor: ThemeKirana.page,
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(32),
            child: Form(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    widget.name,
                    style: TextStyle(
                        color: Colors.lightBlue,
                        fontSize: 36,
                        fontWeight: FontWeight.w500),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  TextFormField(
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      labelText: "Name",
                      labelStyle: TextStyle(color: Colors.white),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                        color: Colors.white38,
                        width: 4,
                        style: BorderStyle.solid,
                      )),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                        color: Colors.white,
                        width: 3,
                      )),
                      floatingLabelBehavior: FloatingLabelBehavior.auto,
                    ),
                    controller: _nameController,
                    //obscureText: true,
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  TextFormField(
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      labelText: "Phone",
                      labelStyle: TextStyle(color: Colors.white),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                        color: Colors.white38,
                        width: 4,
                        style: BorderStyle.solid,
                      )),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                        color: Colors.white,
                        width: 3,
                      )),
                      floatingLabelBehavior: FloatingLabelBehavior.auto,
                    ),
                    controller: _phoneController,
                    //obscureText: true,
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  TextFormField(
                    maxLines: 10,
                    keyboardType: TextInputType.streetAddress,
                    decoration: InputDecoration(
                      labelText: "Address",
                      labelStyle: TextStyle(color: Colors.white),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                        color: Colors.white38,
                        width: 4,
                        style: BorderStyle.solid,
                      )),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                        color: Colors.white,
                        width: 3,
                      )),
                      floatingLabelBehavior: FloatingLabelBehavior.auto,
                    ),
                    controller: _addController,
                    //obscureText: true,
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  Container(
                    width: double.infinity,
                    child: FlatButton(
                      child: Text(widget.name),
                      textColor: Colors.white,
                      padding: EdgeInsets.all(16),
                      onPressed: () {
                        final phone = '+91' + (_phoneController.text.trim());
                        final name = _nameController.text.trim();
                        final add = _addController.text.trim();

                        signUpUser(phone, context, name, add);
                      },
                      color: Colors.blue,
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      );
    }
  }
}
