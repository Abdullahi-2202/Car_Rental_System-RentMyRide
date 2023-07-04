import 'package:flutter/material.dart';
import 'package:rent_my_ride_s1/payment2nd.dart';

class PaymendAdd extends StatelessWidget {
  const PaymendAdd({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Appbar(),
    );
  }
}

class Appbar extends StatelessWidget {
  const Appbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Color.fromARGB(255, 255, 255, 255),
        shadowColor: Color.fromARGB(255, 255, 255, 255),
        centerTitle: true,
        title: Padding(
          padding: const EdgeInsets.only(top: 10),
          child: Image.asset(
            'assets/CarGo2.png',
            color: Colors.black,
            height: 120.0,
            width: 85.0,
          ),
        ),
      ),
      body: Container(
        alignment: Alignment.center,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Flexible(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                  ),
                )
              ],
            ),
            Text(
              "Payment Options",
              style: TextStyle(
                color: Color.fromARGB(255, 255, 0, 0),
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Text(
              "Credit/Debit Card",
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(18)),
                color: Color.fromARGB(255, 255, 0, 0),
              ),
              child: TextButton(
                  style: TextButton.styleFrom(fixedSize: const Size(250, 50)),
                  onPressed: () {
                    Navigator.pushAndRemoveUntil(
                        context,
                        PageRouteBuilder(
                            pageBuilder: (context, a, b) => Payment2nd()),
                        (route) => false);
                  },
                  child: Text(
                    "+ Add Credit/Debit Card     ",
                    style: TextStyle(
                        color: Color.fromARGB(255, 255, 255, 255),
                        fontSize: 20),
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
