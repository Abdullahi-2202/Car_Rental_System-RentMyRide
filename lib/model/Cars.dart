// import 'dart:core';

class Cars {
  final String carId;
  final String carHostId;
  final String carManufacturer;
  final String carModel;
  final int carMakeYear;
  final int carMileage;
  final int carGasConsumption;
  final int carRentPrice;
  final String carLicenseNumber;
  final String carLocation;
  final String carCity;
  final String carWheelDrive;
  final String carTransmission;
  final int carSeats;
  final int carHoursRented;
  final int carTimesRented;
  final String carImageUrl;

  Cars(
      {required this.carId,
      required this.carHostId,
      required this.carManufacturer,
      required this.carModel,
      required this.carMakeYear,
      required this.carMileage,
      required this.carGasConsumption,
      required this.carRentPrice,
      required this.carLicenseNumber,
      required this.carLocation,
      required this.carCity,
      required this.carWheelDrive,
      required this.carTransmission,
      required this.carSeats,
      required this.carHoursRented,
      required this.carTimesRented,
      required this.carImageUrl});
}
