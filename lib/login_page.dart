// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, unused_import, prefer_typing_uninitialized_variables

import 'services/auth.dart';
import 'package:flutter/material.dart';
import 'landing_page.dart';
import 'reusable_widget/InputDeco.dart';
import 'success_page.dart';

class LoginPage extends StatefulWidget {
  final toggleView;
  const LoginPage({Key? key, this.toggleView}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();

  String email = '';
  String password = '';
  String error = '';

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Scaffold(
          //Transparent appbar and back button icon
          extendBodyBehindAppBar: true,
          resizeToAvoidBottomInset: true,
          appBar: AppBar(
              iconTheme: IconThemeData(color: Colors.black),
              backgroundColor: Colors.transparent,
              elevation: 0,
              leading: BackButton(onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LandingPage()),
                );
              })),
          backgroundColor: Colors.white,
          body: SafeArea(
            child: SingleChildScrollView(
              child: Center(
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/logo.jpg',
                    width: 270,
                    height: 200,
                  ),
                  SizedBox(height: 50),
                  Form(
                    key: _formKey,
                    child: Column(children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 25.0),
                        child: Container(
                          decoration: BoxDecoration(),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 0.0),
                            child: TextFormField(
                              decoration:
                                  buildInputDecoration(Icons.email, "Email"),
                              onChanged: (val) {
                                setState(() => email = val);
                              },
                            ),
                          ),
                        ),
                      ),

                      SizedBox(height: 10),

                      //Password
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 25.0),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 0.0),
                          child: TextFormField(
                            decoration:
                                buildInputDecoration(Icons.lock, "Password"),
                            obscureText: true,
                            onChanged: (val) {
                              setState(() => password = val);
                            },
                          ),
                        ),
                      ),

                      SizedBox(height: 10),

                      //Sign in
                      Padding(
                        padding: EdgeInsets.only(top: 20),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                minimumSize: Size(200, 50),
                                textStyle: TextStyle(fontSize: 21),
                                backgroundColor: Colors.deepPurple,
                                foregroundColor: Colors.white,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30.0)),
                              ),
                              child: Text('Sign-In'),
                              onPressed: () async {
                                if (_formKey.currentState!.validate()) {
                                  dynamic result =
                                      await _auth.signInWithEmailAndPassword(
                                          email, password);
                                  if (result == null) {
                                    setState(() {
                                      error = 'Invalid User';
                                    });
                                  } else {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              VerifySuccessful()),
                                    );
                                  }
                                }
                              },
                            ),
                            SizedBox(height: 5.0),
                            Text(
                              error,
                              style:
                                  TextStyle(color: Colors.red, fontSize: 14.0),
                            )
                          ],
                        ),
                      ),

                      SizedBox(height: 25),
                    ]),
                  )
                ],
              )),
            ),
          )),
    );
  }
}
