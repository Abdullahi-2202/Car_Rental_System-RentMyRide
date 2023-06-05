// ignore_for_file: non_constant_identifier_names, prefer_const_constructors, prefer_typing_uninitialized_variables

import 'explore_page.dart';
import 'rent_page.dart';
import 'package:flutter/material.dart';
import 'model/Cars.dart';
import 'reusable_widget/Custom_AppBar.dart';

class BookingConfirmation extends StatefulWidget {
  final Cars car;
  final DateTime startDate;
  final DateTime endDate;

  const BookingConfirmation({
    super.key,
    required this.car,
    required this.startDate,
    required this.endDate,
  });

  @override
  State<BookingConfirmation> createState() => _BookingConfirmationState();
}

class _BookingConfirmationState extends State<BookingConfirmation> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CarGoAppBar(),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          // ignore: prefer_const_literals_to_create_immutables
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    alignment: Alignment.center,
                    width: MediaQuery.of(context).size.width,
                    height: 150,
                    decoration: BoxDecoration(
                        color: Colors.deepPurple,
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(30),
                          bottomRight: Radius.circular(30),
                        )),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      // ignore: prefer_const_literals_to_create_immutables
                      children: [
                        Icon(
                          Icons.check_circle,
                          size: 70,
                          color: Colors.green,
                        ),
                        Text(
                          'Booking Confirmed!',
                          style: TextStyle(
                            fontSize: 25.0,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Text(
                          'Total Amount has been deducted \nfrom your credit card!',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 15.0,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: SizedBox(
                width: double.infinity,
                height: 420.0,
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 10.0),
                      child: Column(
                        children: <Widget>[
                          Container(
                            margin: EdgeInsets.all(10.0),
                            width: double.infinity,
                            height: 200,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15.0),
                              // ignore: prefer_const_literals_to_create_immutables
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.black45,
                                    offset: Offset(0, 5),
                                    blurRadius: 8.0),
                              ],
                              image: DecorationImage(
                                image: NetworkImage(widget.car.carImageUrl),
                                fit: BoxFit.fitWidth,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              // ignore: prefer_const_literals_to_create_immutables
                              children: <Widget>[
                                Text(
                                  '${widget.car.carManufacturer} ${widget.car.carModel} ${widget.car.carMakeYear}',
                                  style: TextStyle(
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                SizedBox(width: 50),
                                Text(
                                  '${widget.car.carRentPrice.round()} RM/hr',
                                  style: TextStyle(
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                SizedBox(
                                  height: 30,
                                )
                              ],
                              // ignore: prefer_const_literals_to_create_immutables
                            ),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 20.0),
                            child: Row(
                              // ignore: prefer_const_literals_to_create_immutables
                              children: [
                                Text(
                                  widget.car.carLocation,
                                  style: TextStyle(
                                    fontSize: 14.0,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                SizedBox(width: 10),
                                Container(
                                  alignment: Alignment.center,
                                  height: 25,
                                  width: 75,
                                  decoration: BoxDecoration(
                                    color: Colors.black12,
                                    borderRadius: BorderRadius.circular(25),
                                  ),
                                  child: Text(
                                    widget.car.carLicenseNumber,
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 14.0,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 20),
                            child: Row(
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  // ignore: prefer_const_literals_to_create_immutables
                                  children: [
                                    Text(
                                      'Start Date: ${widget.startDate.year}/${widget.startDate.month}/${widget.startDate.day} ${widget.startDate.hour}:${widget.startDate.minute}',
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 14.0,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    SizedBox(height: 5),
                                    Text(
                                      'End Date: ${widget.endDate.year}/${widget.endDate.month}/${widget.endDate.day} ${widget.endDate.hour}:${widget.endDate.minute}',
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 14.0,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    SizedBox(height: 5),
                                    Text(
                                      'Hours: ${widget.endDate.difference(widget.startDate).inHours}',
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 14.0,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    SizedBox(height: 5),
                                    Text(
                                      'Total Amount: ${widget.endDate.difference(widget.startDate).inHours * widget.car.carRentPrice.round()} RM',
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 14.0,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            homeButton(context),
            SizedBox(
              height: 15,
            ),
            manageBookingsButton(context),
          ],
        ),
      ),
    );
  }
}

// AppBar CarGoAppBar() {
//   return AppBar(
//     elevation: 0,
//     backgroundColor: Colors.deepPurple,
//     shadowColor: Colors.transparent,
//     centerTitle: true,
//     title: Padding(
//       padding: const EdgeInsets.only(top: 2),
//       child: Image.asset(
//         'assets/CarGo2.png',
//         color: Colors.black,
//         height: 120.0,
//         width: 90.0,
//       ),
//     ),
//   );
// }

Padding homeButton(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 20.0),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ElevatedButton(
            style: ElevatedButton.styleFrom(
              minimumSize: Size(250, 50),
              textStyle: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              backgroundColor: Colors.deepPurple,
              foregroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0)),
            ),
            child: Text('Home'),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => ExplorePage()));
            }),
      ],
    ),
  );
}

Padding manageBookingsButton(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 20.0),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ElevatedButton(
            style: ElevatedButton.styleFrom(
              minimumSize: Size(200, 50),
              textStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              backgroundColor: Colors.deepPurple,
              foregroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0)),
            ),
            child: Text('Manage Bookings'),
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => RentPage()));
            }),
      ],
    ),
  );
}
