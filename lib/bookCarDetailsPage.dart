// ignore_for_file: file_names, prefer_const_literals_to_create_immutables, prefer_const_constructors, non_constant_identifier_names

import 'bookingConfirmationPage.dart';
import 'services/auth.dart';
import 'services/database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'model/Cars.dart';
import 'reusable_widget/Custom_AppBar.dart';

class Car {
  String carId,
      carPicture,
      carManfacturer,
      carModel,
      carMakeYear,
      carLocation,
      carLicenseNumber,
      carHostName,
      carWheelDrive,
      carSeats,
      carGearBox,
      carFuelConsumption,
      carMileage;
  double carRentPrice;
  Car(
      {required this.carId,
      required this.carPicture,
      required this.carManfacturer,
      required this.carModel,
      required this.carMakeYear,
      required this.carLocation,
      required this.carLicenseNumber,
      required this.carHostName,
      required this.carWheelDrive,
      required this.carSeats,
      required this.carGearBox,
      required this.carFuelConsumption,
      required this.carMileage,
      required this.carRentPrice});
}

class BookCarDetails extends StatefulWidget {
  const BookCarDetails({super.key, required this.car});
  final Cars car;
  // final Cars car;

  @override
  State<BookCarDetails> createState() => _BookCarDetailsState();
}

class _BookCarDetailsState extends State<BookCarDetails> {
  AuthService _auth = AuthService();

  DateTime startDateTime = DateTime.now();
  DateTime gapDate = DateTime.now();
  DateTime endDateTime = DateTime.now();
  String startDateBox = 'Start Date';
  String endDateBox = 'End Date';
  bool paymentStatus = true;
  bool userDocumentStatus = true;
  String hostName = 'Rayhan Sharif';
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: CarGoAppBar(),
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      margin: EdgeInsets.all(5),
                      child: Text(
                        'Book Car',
                        style: TextStyle(
                          fontSize: 30.0,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              bookCarContainer(context, widget.car),
            ],
          ),
        ),
      ),
    );
  }

  Padding bookCarContainer(BuildContext context, Cars car) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 5),
      child: Container(
        width: double.infinity,
        height: 730,
        decoration: BoxDecoration(
          color: Color.fromARGB(233, 248, 248, 251),
          borderRadius: BorderRadius.circular(25),
        ),
        child: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.symmetric(vertical: 0),
              child: Column(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.all(10),
                    width: double.infinity,
                    height: 200,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black45,
                            offset: Offset(0, 5),
                            blurRadius: 8),
                      ],
                      image: DecorationImage(
                        image: NetworkImage(car.carImageUrl),
                        fit: BoxFit.fitWidth,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          '${car.carManufacturer} ${car.carModel} ${car.carMakeYear}',
                          style: TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        SizedBox(width: 80),
                        Text(
                          '${car.carRentPrice.round()} RM/hr',
                          style: TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        SizedBox(
                          height: 40,
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Row(
                      children: [
                        Text(
                          car.carLocation,
                          style: TextStyle(
                            fontSize: 14.0,
                          ),
                        ),
                        SizedBox(width: 20),
                        Container(
                          alignment: Alignment.center,
                          height: 25,
                          width: 75,
                          decoration: BoxDecoration(
                            color: Colors.black12,
                            borderRadius: BorderRadius.circular(25),
                          ),
                          child: Text(
                            car.carLicenseNumber,
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 14.0,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Divider(
                    height: 25,
                    thickness: 1,
                    indent: 50,
                    endIndent: 50,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Host',
                          style: TextStyle(
                            fontSize: 14.0,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              margin: EdgeInsets.fromLTRB(5, 10, 5, 5),
                              child: CircleAvatar(
                                backgroundColor: Colors.black,
                                radius: 21,
                                child: CircleAvatar(
                                  radius: 25,
                                  backgroundImage:
                                      AssetImage('assets/profile.png'),
                                ),
                              ),
                            ),
                            SizedBox(width: 5),
                            Text(
                              hostName,
                              style: TextStyle(
                                fontSize: 14.0,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Divider(
                    height: 30,
                    thickness: 1,
                    indent: 50,
                    endIndent: 50,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          margin: EdgeInsets.only(bottom: 10),
                          child: Text(
                            'Features',
                            style: TextStyle(
                              fontSize: 14.0,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Image.asset(
                                  'assets/wheel.png',
                                  height: 40,
                                  width: 30,
                                ),
                                Text(
                                  car.carWheelDrive,
                                  style: TextStyle(
                                    fontSize: 14.0,
                                  ),
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                Image.asset(
                                  'assets/seat.png',
                                  height: 40,
                                  width: 30,
                                ),
                                Text(
                                  '${car.carSeats.toString()} Seats',
                                  style: TextStyle(
                                    fontSize: 14.0,
                                  ),
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                Image.asset(
                                  'assets/gearBox.png',
                                  height: 40,
                                  width: 25,
                                ),
                                Text(
                                  car.carTransmission,
                                  style: TextStyle(
                                    fontSize: 14.0,
                                  ),
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                Image.asset(
                                  'assets/fuelConsumption.png',
                                  height: 40,
                                  width: 25,
                                ),
                                Text(
                                  '${car.carGasConsumption.toString()} Km/L',
                                  style: TextStyle(
                                    fontSize: 14.0,
                                  ),
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                Image.asset(
                                  'assets/milage.png',
                                  height: 40,
                                  width: 30,
                                ),
                                Text(
                                  '${car.carMileage.toString()} Km',
                                  style: TextStyle(
                                    fontSize: 14.0,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Divider(
                    height: 30,
                    thickness: 1,
                    indent: 50,
                    endIndent: 50,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          margin: EdgeInsets.only(bottom: 10),
                          child: Text(
                            'Rent Period',
                            style: TextStyle(
                              fontSize: 14.0,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  width: 140,
                                  height: 60,
                                  decoration: BoxDecoration(
                                    color: Colors.black12,
                                    borderRadius: BorderRadius.circular(25),
                                  ),
                                  child: startDateCupertinoButton(context),
                                ),
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'To',
                                  style: TextStyle(
                                      fontSize: 14.0,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  width: 140,
                                  height: 60,
                                  decoration: BoxDecoration(
                                    color: Colors.black12,
                                    borderRadius: BorderRadius.circular(25),
                                  ),
                                  child: endDateCupertinoButton(context),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  bookingButton(),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Padding bookingButton() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
              style: ElevatedButton.styleFrom(
                minimumSize: Size(180, 50),
                textStyle: TextStyle(fontSize: 20),
                backgroundColor: Colors.deepPurple,
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0)),
              ),
              child: Text('Book'),
              onPressed: () {
                if (paymentStatus && userDocumentStatus) {
                  print(
                      "Book has been pressed with these dates: $startDateTime ### $endDateTime");
                  _auth.updateBookedCollection(
                    widget.car.carId,
                    startDateTime,
                    endDateTime,
                    'booked',
                  );
                  int newHoursRented =
                      endDateTime.difference(startDateTime).inHours +
                          widget.car.carHoursRented;
                  int newTimesRented = 1 + widget.car.carTimesRented;
                  DatabaseService().updateTimesHoursRentedCarCollection(
                      widget.car.carId, newHoursRented, newTimesRented);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => BookingConfirmation(
                        car: widget.car,
                        startDate: startDateTime,
                        endDate: endDateTime,
                      ),
                    ),
                  );
                } else {
                  //Documents and payment method pop up message
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: popUpMessage(),
                      behavior: SnackBarBehavior.floating,
                      backgroundColor: Colors.transparent,
                      elevation: 0,
                      duration: Duration(seconds: 5),
                    ),
                  );
                }
              }),
        ],
      ),
    );
  }

  Stack popUpMessage() {
    return Stack(
      children: [
        Container(
          padding: EdgeInsets.all(15),
          height: 90,
          decoration: BoxDecoration(
            color: Color(0xFFC72C41),
            borderRadius: BorderRadius.all(Radius.circular(30)),
          ),
          child: Row(
            children: [
              //const SizedBox(width: 48),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Reminder!",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 18, color: Colors.white),
                    ),
                    SizedBox(height: 3),
                    Text(
                      'Please Provide required documents and payment method in your Profile.',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 12.0,
                        color: Colors.white,
                        //fontWeight: FontWeight.bold,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  CupertinoButton endDateCupertinoButton(BuildContext context) {
    return CupertinoButton(
      onPressed: () {
        showCupertinoModalPopup(
            context: context,
            builder: (BuildContext context) => Container(
                  color: Colors.transparent,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      SizedBox(
                        height: 250,
                        child: CupertinoDatePicker(
                          backgroundColor: Colors.white,
                          initialDateTime: gapDate,
                          minimumDate: gapDate,
                          maximumDate: DateTime(2024),
                          onDateTimeChanged: (DateTime newTime) {
                            setState(() => endDateTime = newTime);
                            endDateBox =
                                '${endDateTime.year}/${endDateTime.month}/${endDateTime.day} ${endDateTime.hour}:${endDateTime.minute}';
                          },
                          use24hFormat: true,
                          mode: CupertinoDatePickerMode.dateAndTime,
                        ),
                      ),
                      SizedBox(
                        width: 250,
                        height: 51,
                        child: CupertinoButton(
                          color: Colors.deepPurpleAccent,
                          child: const Text('OK'),
                          onPressed: () => Navigator.pop(context),
                        ),
                      ),
                    ],
                  ),
                ));
      },
      child: Text(
        endDateBox,
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 12.0,
          color: Colors.black,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  CupertinoButton startDateCupertinoButton(BuildContext context) {
    return CupertinoButton(
      onPressed: () {
        showCupertinoModalPopup(
            context: context,
            builder: (BuildContext context) => Container(
                  color: Colors.transparent,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      SizedBox(
                        height: 250,
                        child: CupertinoDatePicker(
                          key: UniqueKey(),
                          backgroundColor: Colors.white,
                          minimumDate: DateTime.now(),
                          maximumDate: DateTime(2024),
                          onDateTimeChanged: (DateTime newTime) {
                            setState(() {
                              startDateTime = newTime;
                            });
                            gapDate = startDateTime.add(Duration(hours: 1));
                            endDateTime = gapDate;
                            endDateBox =
                                '${endDateTime.year}/${endDateTime.month}/${endDateTime.day} ${endDateTime.hour}:${endDateTime.minute}';
                            startDateBox =
                                '${startDateTime.year}/${startDateTime.month}/${startDateTime.day} ${startDateTime.hour}:${startDateTime.minute}';
                          },
                          use24hFormat: true,
                          mode: CupertinoDatePickerMode.dateAndTime,
                        ),
                      ),
                      SizedBox(
                        width: 250,
                        height: 51,
                        child: CupertinoButton(
                          color: Colors.deepPurpleAccent,
                          child: const Text('OK'),
                          onPressed: () => Navigator.pop(context),
                        ),
                      ),
                    ],
                  ),
                ));
      },
      child: Text(
        startDateBox,
        textAlign: TextAlign.center,
        style: TextStyle(
            fontSize: 12.0, color: Colors.black, fontWeight: FontWeight.bold),
      ),
    );
  }
}

// AppBar CarGoAppBar() {
//   return AppBar(
//     elevation: 0,
//     leading: BackButton(color: Colors.black),
//     backgroundColor: Colors.transparent,
//     shadowColor: Colors.transparent,
//     centerTitle: true,
//     title: Padding(
//       padding: const EdgeInsets.only(top: 2),
//       child: Image.asset(
//         'assets/logo.jpg',
//         color: Colors.black,
//         height: 120.0,
//         width: 90.0,
//       ),
//     ),
//   );
// }
