import 'package:Kirana/customExports.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ESignUp extends StatefulWidget {
  @override
  _ESignUpState createState() => _ESignUpState();
}

class _ESignUpState extends State<ESignUp> {
  String _email;

  // ignore: unused_field
  String _name;

  String _password;

  // ignore: unused_field
  String _addresses;

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
        child: Stack(
          children: [
            Container(
              height: double.infinity,
              width: double.infinity,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    TextLog(text: 'Sign Up'),
                    SizedBox(height: 50),
                    Form(
                      key: _formKey2,
                      child: Column(
                        children: [
                          InputFields(
                            encrypto: false,
                            hint: 'Name',
                            type: TextInputType.name,
                            fun: (input) {
                              _name = input;
                            },
                          ),
                          InputFields(
                            encrypto: false,
                            hint: 'Email',
                            type: TextInputType.emailAddress,
                            fun: (input) {
                              _email = input;
                            },
                          ),
                          InputFields(
                            encrypto: true,
                            hint: 'Password',
                            type: TextInputType.visiblePassword,
                            fun: (input) {
                              _password = input;
                            },
                          ),
                          address((input) {
                            _addresses = input;
                          }),
                        ],
                      ),
                    ),
                    Button15(
                      text: 'SIGN UP',
                      click: emailSignup,
                    ),
                    Not(
                      text: 'LOGIN',
                      msg: 'Already a Member ? ',
                      tap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => EmailLoginPage(),
                          ),
                        );
                      },
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void emailSignup() async {
    final form = _formKey2.currentState;
    // ignore: unused_local_variable
    User user = FirebaseAuth.instance.currentUser;
    if (form.validate()) {
      try {
        form.save();
        FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: _email,
          password: _password,
        );
        FirebaseAuth.instance.authStateChanges().listen((user) {
          if (user != null) {
            print('Counter');
          }
        });
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => EmailLoginPage()),
            (route) => false);
      } catch (e) {
        print(e.message);
      }
    }
  }
}

Widget address(fun) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      SizedBox(height: 10),
      Container(
        alignment: Alignment.centerLeft,
        margin: EdgeInsets.fromLTRB(10, 0, 10, 30),
        decoration: BoxDecoration(
          color: ThemeKirana.page,
        ),
        height: 60,
        child: TextFormField(
          obscureText: false,
          keyboardType: TextInputType.multiline,
          maxLines: 3,
          style: TextStyle(
            color: ThemeKirana.white,
          ),
          decoration: InputDecoration(
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(width: 2.50, color: ThemeKirana.white),
            ),
            contentPadding: EdgeInsets.only(top: 14, left: 10),
            hintText: 'Address',
            hintStyle: TextStyle(
              color: ThemeKirana.white,
              fontSize: 18,
            ),
          ),
          onSaved: fun,
        ),
      ),
    ],
  );
}
