// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, non_constant_identifier_names, unnecessary_this, unnecessary_nullable_for_final_variable_declarations, prefer_interpolation_to_compose_strings, avoid_print, no_logic_in_create_state, must_be_immutable

import 'host_page.dart';

import 'services/auth.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'reusable_widget/Custom_AppBar.dart';

class ViewAddedVehicle extends StatefulWidget {
  ViewAddedVehicle(
      {super.key,
      required this.manufacturer,
      required this.model,
      required this.makeyear,
      required this.gasConsumption,
      required this.mileage,
      required this.rentPrice,
      required this.licenseNumber,
      required this.wheelDrive,
      required this.seats,
      required this.transmission,
      required this.location,
      required this.city,
      required this.hoursRented,
      required this.timesRented,
      required this.imageUrl});
  final Text manufacturer;
  final Text model;
  final Text makeyear;
  final Text gasConsumption;
  final Text mileage;
  final Text rentPrice;
  final Text licenseNumber;
  final Text wheelDrive;
  final Text seats;
  final Text transmission;
  final Text location;
  final Text city;
  final String imageUrl;
  int hoursRented;
  int timesRented;

  @override
  State<StatefulWidget> createState() =>
      ViewAddedVehicleState(hoursRented, timesRented, imageUrl);
}

class ViewAddedVehicleState extends State<ViewAddedVehicle> {
  final AuthService _auth = AuthService();

  int hoursRented;
  int timesRented;
  String imageUrl;

  ViewAddedVehicleState(this.hoursRented, this.timesRented, this.imageUrl);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: CarGoAppBar(),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
            child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 5),
              SizedBox(height: 10),
              Text(
                'Confirm Car Details',
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 5),
              Padding(
                padding: EdgeInsets.only(top: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text("Manufacturer",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 15)),
                    widget.manufacturer,
                    SizedBox(height: 8),
                    Text("Model",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 15)),
                    widget.model,
                    SizedBox(height: 8),
                    Text("Make Year",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 15)),
                    widget.makeyear,
                    SizedBox(height: 8),
                    Text("Gas Consumption",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 15)),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [widget.gasConsumption, Text(" KM/L")],
                    ),
                    SizedBox(height: 8),
                    Text("Mileage",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 15)),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [widget.mileage, Text(" KM")],
                    ),
                    SizedBox(height: 8),
                    Text("Rent Price",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 15)),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [widget.rentPrice, Text(" RM/Hour")],
                    ),
                    SizedBox(height: 8),
                    Text("License Number",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 15)),
                    widget.licenseNumber,
                    SizedBox(height: 8),
                    Text("Wheel Drive",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 15)),
                    widget.wheelDrive,
                    SizedBox(height: 8),
                    Text("Number of seats",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 15)),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [widget.seats, Text(" Seats")],
                    ),
                    SizedBox(height: 8),
                    Text("Transmission",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 15)),
                    widget.transmission,
                    SizedBox(height: 8),
                    Text("City",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 15)),
                    widget.city,
                    SizedBox(height: 8),
                    Text("Location",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 15)),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        widget.location,
                      ],
                    ),
                    SizedBox(height: 10),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        minimumSize: Size(150, 45),
                        textStyle: TextStyle(fontSize: 17),
                        backgroundColor: Colors.deepPurple,
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.0)),
                      ),
                      child: Text('Add Car'),
                      onPressed: () {
                        //database
                        final String hostId = _auth.getUserId();
                        dynamic result = _auth.createCarCollectionUser(
                          hostId,
                          '${widget.manufacturer.data}',
                          '${widget.model.data}',
                          int.parse('${widget.makeyear.data}'),
                          int.parse('${widget.mileage.data}'),
                          int.parse('${widget.gasConsumption.data}'),
                          int.parse('${widget.rentPrice.data}'),
                          '${widget.licenseNumber.data}',
                          '${widget.location.data}',
                          '${widget.city.data}',
                          '${widget.wheelDrive.data}',
                          '${widget.transmission.data}',
                          int.parse('${widget.seats.data}'),
                          widget.hoursRented,
                          widget.timesRented,
                          widget.imageUrl,
                        );
                        if (result == null) {
                          print("Error");
                        } else {
                          print("successful");
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => Hostpage()),
                          );
                        }
                      },
                    ),
                    SizedBox(height: 20),
                  ],
                ),
              ),
            ],
          ),
        )),
      ),
    );
  }

  final ImagePicker imagePicker = ImagePicker();
  List<XFile>? imageFileList = [];

  void selectImages() async {
    final List<XFile>? selectedImages = await imagePicker.pickMultiImage();
    if (selectedImages!.isNotEmpty) {
      imageFileList!.addAll(selectedImages);
    }
    print("Image List Length:" + imageFileList!.length.toString());
    setState(() {});
  }
}
