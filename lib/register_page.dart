import 'package:flutter/material.dart';
import 'package:rent_my_ride_s1/success_page.dart';
import 'landing_page.dart';
import 'services/database.dart';
import 'services/auth.dart';
import 'reusable_widget/InputDeco.dart';

class RegisterPage extends StatefulWidget {
  final toggleView;
  const RegisterPage({Key? key, this.toggleView}) : super(key: key);

  @override
  State<RegisterPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<RegisterPage> {
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();

  //text field state
  String email = '';
  String password = '';
  String fullname = '';
  String cPassword = '';
  String error = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //Transparent appbar and back button icon
      extendBodyBehindAppBar: true,
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
              SizedBox(height: 20),

              Image.asset(
                'assets/logo.jpg',
                width: 270,
                height: 200,
              ),

              // SizedBox(height: 10),
              Text(
                'No Time To Waste!',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 50),

              //FORM
              Form(
                key: _formKey,
                child: Column(children: <Widget>[
                  //Fullname
                  // Padding(
                  //   padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  //   child: Container(
                  //     decoration: BoxDecoration(
                  //       borderRadius: BorderRadius.circular(15),
                  //     ),
                  //     child: Padding(
                  //       padding: const EdgeInsets.only(left: 0.0),
                  //       child: TextFormField(
                  //         decoration:
                  //             buildInputDecoration(Icons.person, "Full Name"),
                  //         validator: (val) {
                  //           if (val!.isEmpty) {
                  //             return "Enter your Full Name";
                  //           }
                  //           if (!RegExp(r"^[a-z ,.'-]+$", caseSensitive: false)
                  //               .hasMatch(val)) {
                  //             return "Enter a Valid Name";
                  //           }
                  //           return null;
                  //         },
                  //         onChanged: (val) {
                  //           setState(() => fullname = val);
                  //         },
                  //       ),
                  //     ),
                  //   ),
                  // ),

                  // SizedBox(height: 10),

                  //Email
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25.0),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 0.0),
                        child: TextFormField(
                          decoration:
                              buildInputDecoration(Icons.email, "Email"),
                          keyboardType: TextInputType.text,
                          validator: (val) {
                            if (val!.isEmpty) {
                              return "Enter an Email";
                            }
                            if (!RegExp(
                                    "^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
                                .hasMatch(val)) {
                              return "Enter a Valid Email";
                            }
                            return null;
                          },
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
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 0.0),
                        child: TextFormField(
                          decoration:
                              buildInputDecoration(Icons.lock, "Password"),
                          //Return null if valid
                          validator: (val) {
                            if (val!.isEmpty) {
                              return "Enter a Password";
                            }
                            if (val.length < 6) {
                              return "Enter a Password 6 chars long";
                            }
                            return null;
                          },
                          onChanged: (val) {
                            setState(() => password = val);
                          },
                          obscureText: true,
                        ),
                      ),
                    ),
                  ),

                  SizedBox(height: 10),

                  //Confirm Password
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25.0),
                    child: Container(
                      decoration: BoxDecoration(),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 0.0),
                        child: TextFormField(
                          decoration: buildInputDecoration(
                              Icons.lock, "Confirm Password"),
                          validator: (val) {
                            if (val!.isEmpty) {
                              return "Re-enter Password";
                            }
                            if (val != password) {
                              return "Password doesn't match";
                            }
                            return null;
                          },
                          onChanged: (val) {
                            setState(() => cPassword = val);
                          },
                          obscureText: true,
                        ),
                      ),
                    ),
                  ),

                  SizedBox(height: 10),
                  //Sign Up
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
                          child: Text('Sign Up'),
                          onPressed: () async {
                            if (_formKey.currentState!.validate()) {
                              dynamic result =
                                  await _auth.registerWithEmailAndPassword(
                                      fullname, email, password, cPassword);
                              if (result == null) {
                                error = "Email Already in use";
                              } else {
                                error = '';
                                // ignore: use_build_context_synchronously
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const VerifySuccessful()),
                                );
                              }
                            }
                          },
                        ),
                        SizedBox(height: 5.0),
                        Text(
                          error,
                          style: TextStyle(color: Colors.red, fontSize: 14.0),
                        )
                      ],
                    ),
                  ),
                ]),
              ),
            ],
          ),
        )),
      ),
    );
  }
}
