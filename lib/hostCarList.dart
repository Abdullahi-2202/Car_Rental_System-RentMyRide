// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'hostCarTile.dart';
import 'model/Cars.dart';

class HostCarList extends StatefulWidget {
  const HostCarList({super.key});

  @override
  State<HostCarList> createState() => _HostCarListState();
}

class _HostCarListState extends State<HostCarList> {
  @override
  Widget build(BuildContext context) {
    final cars = Provider.of<List<Cars>?>(context) ?? [];

    return ListView.builder(
      itemCount: cars.length,
      itemBuilder: (context, index) {
        return HostCarTile(car: cars[index]);
      },
    );
  }
}
