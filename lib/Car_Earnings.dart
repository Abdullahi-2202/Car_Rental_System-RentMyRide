// ignore_for_file: unused_import
// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:rent_my_ride_s1/square.dart';
// import 'package:rent_my_ride_s1/update_car.dart';
import 'model/Cars.dart';
import 'services/database.dart';
import 'reusable_widget/Custom_AppBar.dart';
import 'bookCarDetailsPage.dart';
import 'update_car.dart';

class CarEarnings extends StatefulWidget {
  final Cars cars;

  const CarEarnings({Key? key, required this.cars}) : super(key: key); //

  @override
  _CarEarningsState createState() => _CarEarningsState();
}

class _CarEarningsState extends State<CarEarnings> {
  final DatabaseService databaseService = DatabaseService();
  //database service object is used to interact with the database to delete the car.

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CarGoAppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
        child: Container(
          //container to contain content of page
          width: double.infinity, // property of container
          height: 550.0,
          decoration: BoxDecoration(
            color: Color.fromARGB(233, 248, 248, 251),
            borderRadius: BorderRadius.circular(25),
          ),
          child: Column(
            // Column widget contains the various widgets for displaying the car details.
            children: <Widget>[
              SizedBox(height: 20),
              Text(
                "Car Details",
                style: TextStyle(
                  fontSize: 25.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 10.0),
                child: Column(
                  // using column widget for displaying the  location, hours rented, times rented, and total earnings.
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.all(10.0),
                      width: double.infinity,
                      height: 200,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15.0),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black45,
                            offset: Offset(0, 5),
                            blurRadius: 8.0,
                          ),
                        ],
                        image: DecorationImage(
                          image: NetworkImage(widget.cars.carImageUrl),
                          fit: BoxFit.fitWidth,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        //Row widget
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            //text widget to display manufacturer and model etc
                            '${widget.cars.carManufacturer} ${widget.cars.carModel} ${widget.cars.carMakeYear}',
                            style: TextStyle(
                              fontSize: 18.0,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          SizedBox(width: 60),
                          Text(
                            // rent price
                            '${widget.cars.carRentPrice} RM/hr',
                            style: TextStyle(
                              fontSize: 18.0,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          SizedBox(height: 30), // to add space below the row
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: Row(
                        children: [
                          Text(
                            //location and city
                            '${widget.cars.carLocation}, ${widget.cars.carCity}',
                            style: TextStyle(
                              fontSize: 14.0,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10),
              Text(
                //to show hours rented, time rented and total earning
                'Hours Rented: ${widget.cars.carHoursRented}',
                style: TextStyle(
                  fontSize: 14.0,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(height: 10),
              Text(
                'Times Rented: ${widget.cars.carTimesRented}',
                style: TextStyle(
                  fontSize: 14.0,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(height: 10),
              Text(
                'Total Earnings: ${widget.cars.carHoursRented * widget.cars.carRentPrice} RM',
                style: TextStyle(
                  fontSize: 14.0,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(height: 20),
              TextButton(
                onPressed: () {
                  _deleteCar(context);
                },
                child: Text('Delete Car'),
              ),
              SizedBox(height: 10),
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => PaymentPage(),
                    ),
                  );
                },
                child: Text('Update Car Details'),
              )
            ],
          ),
        ),
      ),
    );
  }

  // Delete the car
  void _deleteCar(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Delete Car'),
          content: Text('Are you sure you want to delete this car?'),
          actions: [
            TextButton(
              onPressed: () {
                databaseService.deleteCar(widget.cars.carId);
                Navigator.of(context).pop();
              },
              child: Text('Yes'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('No'),
            ),
          ],
        );
      },
    );
  }

  //Update the car
  // void _updateCar(BuildContext context) {
  //   Navigator.push(
  //     context,
  //     MaterialPageRoute(
  //       builder: (context) => UpdateCarPage(car: widget.car),
  //     ),
  //   );
  // }
}
