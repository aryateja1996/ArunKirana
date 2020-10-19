import 'package:Kirana/Pages/pages.dart';
import 'package:Kirana/firebase.dart';
import 'package:Kirana/theme.dart';
import 'package:Kirana/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class EmailLoginPage extends StatefulWidget {
  @override
  _EmailLoginPageState createState() => _EmailLoginPageState();
}

class _EmailLoginPageState extends State<EmailLoginPage> {
  String _email;
  String _password;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ThemeKirana.page,
        elevation: 0,
        actions: [
          CircleButton(),
        ],
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
                physics: AlwaysScrollableScrollPhysics(),
                //padding: EdgeInsets.symmetric(horizontal: 25, vertical: 120),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextLog(text: 'Login'),
                    SizedBox(height: 50),
                    Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          InputFields(
                            encrypto: false,
                            hint: 'Email',
                            fun: (input) => _email,
                          ),
                          InputFields(
                            encrypto: true,
                            hint: 'Password',
                            fun: (input) => _password,
                          ),
                          Button15(
                            text: 'Login',
                            click: loginemail,
                          ),
                        ],
                      ),
                    ),
                    Not(
                      text: 'SIGN UP',
                      msg: 'Not a Member ?  ',
                      tap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => SignUp()),
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

  Future<void> loginemail() async {
    final form = _formKey.currentState;
    if (form.validate()) {
      try {
        form.save();
        FirebaseAuth.instance
            .signInWithEmailAndPassword(email: _email, password: _password);
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => Home()));
      } catch (e) {
        print(e.message);
      }
    }
  }
}
