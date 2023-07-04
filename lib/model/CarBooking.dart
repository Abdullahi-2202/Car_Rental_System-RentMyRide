class CarBooking {
  final String carBookingId;
  final String carId;
  final String carCustomerId;
  final DateTime carBookingStartDate;
  final DateTime carBookingEndDate;
  final String carBookingStatus;

  CarBooking(
      {required this.carBookingId,
      required this.carId,
      required this.carCustomerId,
      required this.carBookingStartDate,
      required this.carBookingEndDate,
      required this.carBookingStatus});
}
