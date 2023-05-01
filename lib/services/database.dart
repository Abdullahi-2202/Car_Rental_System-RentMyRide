// ignore_for_file: avoid_print

// import 'package:cargo/model/CarBooking.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

// import '../model/Cars.dart';

class DatabaseService {
  //Collection Reference

  final String? uid;
  DatabaseService({this.uid});

  final CollectionReference carCollection =
      FirebaseFirestore.instance.collection('cars');

  final CollectionReference usersCollection =
      FirebaseFirestore.instance.collection('user');

  final CollectionReference bookedCarsCollection =
      FirebaseFirestore.instance.collection('carBooking');

//to Store the registered user information so later it can be modified
  Future updateUserData(
      String userFullName, String userEmail, String userPassword) async {
    return await usersCollection.doc(uid).set({
      'userFullName': userFullName,
      'userEmail': userEmail,
      'userPassword': userPassword,
    });
  }

  Future carDetailsCollection(
    String hostId,
    String manufacturer,
    String model,
    int makeYear,
    int mileage,
    int gasConsumption,
    int rentPrice,
    String licenseNumber,
    String location,
    String city,
    String wheelDrive,
    String transmission,
    int seats,
    int hoursRented,
    int timesRented,
    String imageUrl,
  ) async {
    return await carCollection.doc().set({
      'carHostId': hostId,
      'carManufacturer': manufacturer,
      'carModel': model,
      'carMakeYear': makeYear,
      'carMileage': mileage,
      'carGasConsumption': gasConsumption,
      'carRentPrice': rentPrice,
      'carLicenseNumber': licenseNumber,
      'carLocation': location,
      'carCity': city,
      'carWheelDrive': wheelDrive,
      'carTransmission': transmission,
      'carSeats': seats,
      'carHoursRented': hoursRented,
      'carTimesRented': timesRented,
      'carImageUrl': imageUrl,
    });
  }

  Future updateTimesHoursRentedCarCollection(
    String carId,
    int hoursRented,
    int timesRented,
  ) async {
    return await carCollection.doc(carId).update({
      'carHoursRented': hoursRented,
      'carTimesRented': timesRented,
    });
  }

  Future updateBookedCarsCollection(
    String carId,
    String customerId,
    DateTime bookingStartDate,
    DateTime bookingEndDate,
    String bookingStatus,
  ) async {
    return await bookedCarsCollection.doc().set({
      'carId': carId,
      'customerId': customerId,
      'bookingStartDate': bookingStartDate,
      'bookingEndDate': bookingEndDate,
      'bookingStatus': bookingStatus,
    });
  }
}
