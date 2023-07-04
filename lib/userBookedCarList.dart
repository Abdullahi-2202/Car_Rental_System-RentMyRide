// ignore_for_file: file_names

import 'model/CarBooking.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'userBookedCarTile.dart';

class UserBookedCarList extends StatefulWidget {
  const UserBookedCarList({super.key});

  @override
  State<UserBookedCarList> createState() => _UserBookedCarListState();
}

class _UserBookedCarListState extends State<UserBookedCarList> {
  @override
  Widget build(BuildContext context) {
    final carBooking = Provider.of<List<CarBooking>?>(context) ?? [];

    return ListView.builder(
      itemCount: carBooking.length,
      itemBuilder: (context, index) {
        return UserBookedCarTile(carBooking: carBooking[index]);
      },
    );
  }
}
