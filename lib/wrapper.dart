import 'package:rent_my_ride_s1/welcome_page.dart';
import 'authenticate/authenticate.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'model/MyUser.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({super.key});

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<MyUser?>(context);

    if (user == null) {
      Navigator.of(context).pushReplacement;
      return Authenticate();
    } else {
      Navigator.of(context).pushReplacement;

      return WelcomePage();
    }
  }
}
