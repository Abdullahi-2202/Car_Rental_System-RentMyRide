// ignore: file_names

import 'model/CarBooking.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'carBookingsCarsTile.dart';
import 'model/Cars.dart';

class CarBookingsCarsList extends StatefulWidget {
  const CarBookingsCarsList({super.key, required this.carBooking});

  final CarBooking carBooking;
  @override
  State<CarBookingsCarsList> createState() => CarBookingsCarListState();
}

class CarBookingsCarListState extends State<CarBookingsCarsList> {
  @override
  Widget build(BuildContext context) {
    final cars = Provider.of<List<Cars>?>(context) ?? [];

    return SingleChildScrollView(
      child: Column(
        children: [
          ListView.builder(
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            itemCount: cars.length,
            itemBuilder: (context, index) {
              return CarBookingsCarsTile(
                  car: cars[index], carBooking: widget.carBooking);
            },
          ),
        ],
      ),
    );
  }
}
