import 'userHistoryCarList.dart';
import 'services/database.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'model/CarBooking.dart';

class HistoryPage extends StatelessWidget {
  const HistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamProvider<List<CarBooking>?>.value(
      initialData: null,
      value: DatabaseService().carBookings,
      child: SafeArea(
          child: Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          // ignore: prefer_const_literals_to_create_immutables
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 10, bottom: 10),
            ),
            Text(
              "Your Rent's History",
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
            ),
            Expanded(child: UserHistoryCarList()),
          ],
        ),
      )),
    );
  }
}
