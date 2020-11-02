import 'dart:ui';

import 'package:Kirana/customExports.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ESignUp extends StatefulWidget {
  @override
  _ESignUpState createState() => _ESignUpState();
}

class _ESignUpState extends State<ESignUp> {
  String _email;
  String _name;
  // ignore: unused_field
  String _phone;
  String _password;
  // ignore: unused_field
  String _address;

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final GlobalKey<FormState> _formKey2 = GlobalKey<FormState>();

  var result;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          actions: [
            CircleButton(),
          ],
          elevation: 0,
          backgroundColor: ThemeKirana.page,
        ),
        backgroundColor: ThemeKirana.page,
        body: AnnotatedRegion<SystemUiOverlayStyle>(
          value: SystemUiOverlayStyle.light,
          child: Container(
            child: SingleChildScrollView(
              physics: AlwaysScrollableScrollPhysics(),
              child: Column(
                children: [
                  TextLog(
                    text: "Sign up",
                  ),
                  SizedBox(height: 30),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 15),
                    child: Form(
                      key: _formKey2,
                      child: Column(
                        children: [
                          TextFormField(
                            keyboardType: TextInputType.name,
                            onSaved: (input) {
                              _name = input;
                            },
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
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          TextFormField(
                            keyboardType: TextInputType.emailAddress,
                            decoration: InputDecoration(
                              labelText: "Email",
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
                            onSaved: (input) {
                              _email = input;
                            },
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          TextFormField(
                            keyboardType: TextInputType.phone,
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
                            onSaved: (input) {
                              _phone = input;
                            },
                          ),
                          SizedBox(
                            height: 10,
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
                            onSaved: (input) {
                              _address = input;
                            },
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          TextFormField(
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(
                              labelText: "Password",
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
                            onSaved: (input) {
                              _password = input;
                            },
                            obscureText: true,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          TextFormField(
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(
                              labelText: "Confrim Password",
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
                            onSaved: (input) {
                              if (_password == input) {
                                print('ok');
                              } else {
                                _scaffoldKey.currentState.showSnackBar(
                                  SnackBar(
                                    content: Text("Password  Did not match"),
                                  ),
                                );
                              }
                            },
                            obscureText: true,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                            child: RaisedButton(
                                onPressed: emailSignup,
                                child: Text(
                                  'Start Your Journey With Us',
                                )),
                          ),
                          SizedBox(height: 25),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SignInButtonBuilder(
                                backgroundColor: Colors.blueGrey[700],
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => PSign()),
                                  );
                                },
                                icon: Icons.phone,
                                width: 220.0,
                                text: 'Use Phone',
                              ),
                              SizedBox(
                                width: 12,
                              ),
                              SignInButtonBuilder(
                                backgroundColor: Colors.blueGrey[700],
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => EmailLoginPage(),
                                    ),
                                  );
                                },
                                icon: Icons.email,
                                width: 220.0,
                                text: 'Login',
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ));
  }

  void emailSignup() async {
    final form = _formKey2.currentState;

    if (form.validate()) {
      try {
        form.save();
        result = await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: _email,
          password: _password,
        );
        // ignore: unused_local_variable

      } catch (e) {
        print(e.message);
      }
      
     

      FirebaseFirestore.instance.collection("user").doc(result.user.uid).set({
        "username": _name,
        "phone": _phone,
        "address": _address,
        "email": _email,
        "admin": false,
      });

      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => EmailLoginPage()),
          (route) => false);
    }
  }
}
