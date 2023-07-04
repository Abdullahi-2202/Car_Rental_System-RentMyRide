import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'car_tile.dart';
import 'model/Cars.dart';

class CarList extends StatefulWidget {
  const CarList({super.key});

  @override
  State<CarList> createState() => _CarListState();
}

class _CarListState extends State<CarList> {
  @override
  Widget build(BuildContext context) {
    final cars = Provider.of<List<Cars>?>(context) ?? [];

    return ListView.builder(
      itemCount: cars.length,
      itemBuilder: (context, index) {
        return CarTile(car: cars[index]);
      },
    );
  }
}
