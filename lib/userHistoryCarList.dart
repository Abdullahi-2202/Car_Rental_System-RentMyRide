// ignore_for_file: file_names

import 'userHistoryCarTile.dart';
import 'model/CarBooking.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UserHistoryCarList extends StatefulWidget {
  const UserHistoryCarList({super.key});

  @override
  State<UserHistoryCarList> createState() => _UserHistoryCarListState();
}

class _UserHistoryCarListState extends State<UserHistoryCarList> {
  @override
  Widget build(BuildContext context) {
    final carBooking = Provider.of<List<CarBooking>?>(context) ?? [];

    return ListView.builder(
      itemCount: carBooking.length,
      itemBuilder: (context, index) {
        return UserHistoryCarTile(carBooking: carBooking[index]);
      },
    );
  }
}
