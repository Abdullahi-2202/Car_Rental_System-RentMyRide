// ignore_for_file: file_names

// ignore_for_file: prefer_interpolation_to_compose_strings, avoid_print

import 'model/CarBooking.dart';
import 'services/auth.dart';
import 'services/database.dart';
import 'model/Cars.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'carBookingsCarsList.dart';

class UserHistoryCarTile extends StatelessWidget {
  final CarBooking carBooking;
  const UserHistoryCarTile({super.key, required this.carBooking});

  @override
  Widget build(BuildContext context) {
    AuthService auth = AuthService();
    final String userId = auth.getUserId();
    //totalEarnings;
    print("String Status: " + carBooking.carBookingStatus);
    print("String Customer: " + carBooking.carCustomerId);
    print("String User Id: " + userId);
    print("String Car Id: " + carBooking.carId);

    if (carBooking.carBookingStatus == 'history' &&
        carBooking.carCustomerId == userId) {
      return StreamProvider<List<Cars>?>.value(
        initialData: null,
        value: DatabaseService().cars,
        child: Expanded(
          child: CarBookingsCarsList(
            carBooking: carBooking,
          ),
        ),
      );
    } else {
      return SizedBox(height: 0, width: 0);
    }
  }
}
