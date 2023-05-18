// ignore_for_file: avoid_print

import 'package:firebase_auth/firebase_auth.dart';
import 'package:rent_my_ride_s1/model/MyUser.dart';

import 'database.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  String getUserId() {
    final User? user = _auth.currentUser;
    final userId = user?.uid;
    return userId.toString();
  }

  MyUser? _userFromFirebaseUser(User? user) {
    return user != null ? MyUser(uid: user.uid) : null;
  }

  //auth change user

  Stream<MyUser?> get user {
    return _auth
        .authStateChanges()
        .map((User? user) => _userFromFirebaseUser(user!));
  }

// register with email and password
  Future registerWithEmailAndPassword(
      String fullname, String email, String password, String cPassword) async {
    try {
      UserCredential? result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      User? user = result.user;

      await DatabaseService(uid: user!.uid)
          .updateUserData(fullname, email, password);
      return _userFromFirebaseUser(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  // sign in with email and password
  Future signInWithEmailAndPassword(String email, String password) async {
    try {
      UserCredential result = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      User? user = result.user;
      return user;
    } catch (error) {
      print(error.toString());
      return null;
    }
  }

// sign out
  Future signOut() async {
    try {
      return await _auth.signOut();
    } catch (error) {
      print(error.toString());
      return null;
    }
  }

  // Create a new car collection when user adds a new car
  Future createCarCollectionUser(
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
    try {
      final User? user = _auth.currentUser;
      final userId = user?.uid;
      await DatabaseService(uid: userId).carDetailsCollection(
          hostId,
          manufacturer,
          model,
          makeYear,
          mileage,
          gasConsumption,
          rentPrice,
          licenseNumber,
          location,
          city,
          wheelDrive,
          transmission,
          seats,
          hoursRented,
          timesRented,
          imageUrl);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  Future updateBookedCollection(
    String carId,
    DateTime bookingStartDate,
    DateTime bookingEndDate,
    String bookingStatus,
  ) async {
    try {
      final User? user = _auth.currentUser;
      final userId = user?.uid;
      await DatabaseService(uid: userId).updateBookedCarsCollection(
        carId,
        userId!,
        bookingStartDate,
        bookingEndDate,
        bookingStatus,
      );
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}
