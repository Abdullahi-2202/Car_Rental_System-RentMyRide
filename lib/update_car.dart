// ignore_for_file: unused_local_variable

import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import 'car_details.dart';
import 'model/cars.dart';
import 'reusable_widget/inputdeco.dart';

class UpdateCarDetails extends StatefulWidget {
  final Cars carDetails;

  UpdateCarDetails({required this.carDetails, Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => UpdateCarDetailsState();
}

class UpdateCarDetailsState extends State<UpdateCarDetails> {
  final manufacturer = TextEditingController();
  final model = TextEditingController();
  final makeyear = TextEditingController();
  final mileage = TextEditingController();
  final gasConsumption = TextEditingController();
  final rentPrice = TextEditingController();
  final licenseNumber = TextEditingController();
  final location = TextEditingController();
  final city = TextEditingController();
  int hoursRented = 0;
  int timesRented = 0;
  String imageUrl = '';

  List<String> wheelDriveMenu = ['4WD', '2WD'];
  String? selectedWheelDrive;

  List<String> seatNum = ['2', '4', '6', '8'];
  String? selectedSeatNum;

  List<String> TransmissionType = ['Automatic', 'Manual'];
  String? selectedTransType;

  List<String> cityName = [
    'Kuala Lumpur',
    'Alor Setar',
    'Kuching',
    'Ipoh',
    'Melacca',
    'Johor Bahru'
  ];
  String? selectedCity;

  @override
  void initState() {
    super.initState();
    // Set the initial values of the text controllers based on the provided car details
    manufacturer.text = widget.carDetails.carManufacturer;
    model.text = widget.carDetails.carModel;
    makeyear.text = widget.carDetails.carMakeYear.toString();
    mileage.text = widget.carDetails.carMileage.toString();
    gasConsumption.text = widget.carDetails.carGasConsumption.toString();
    rentPrice.text = widget.carDetails.carRentPrice.toString();
    licenseNumber.text = widget.carDetails.carLicenseNumber;
    location.text = widget.carDetails.carLocation;
    city.text = widget.carDetails.carCity;
    selectedWheelDrive = widget.carDetails.carWheelDrive;
    selectedSeatNum = widget.carDetails.carSeats.toString();

    selectedCity = widget.carDetails.carCity;
    imageUrl = widget.carDetails.carImageUrl;
  }

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    manufacturer.dispose();
    model.dispose();
    makeyear.dispose();
    mileage.dispose();
    gasConsumption.dispose();
    rentPrice.dispose();
    licenseNumber.dispose();
    location.dispose();
    city.dispose();
    super.dispose();
  }

  bool isFile = false;
  late XFile fileImage;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Update Car Details'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              TextField(
                controller: manufacturer,
                decoration: buildInputDecoration(
                  'Manufacturer',
                  Icon(Icons.car_rental),
                ),
              ),
              SizedBox(height: 10),
              TextField(
                controller: model,
                decoration: buildInputDecoration(
                  'Model',
                  Icon(Icons.model_training),
                ),
              ),
              SizedBox(height: 10),
              TextField(
                controller: makeyear,
                keyboardType: TextInputType.number,
                decoration: buildInputDecoration(
                  'Make Year',
                  Icon(Icons.date_range),
                ),
              ),
              SizedBox(height: 10),
              TextField(
                controller: mileage,
                keyboardType: TextInputType.number,
                decoration: buildInputDecoration(
                  'Mileage (in km)',
                  Icon(Icons.timeline),
                ),
              ),
              SizedBox(height: 10),
              TextField(
                controller: gasConsumption,
                keyboardType: TextInputType.number,
                decoration: buildInputDecoration(
                  'Gas Consumption (in L/100km)',
                  Icon(Icons.local_gas_station),
                ),
              ),
              SizedBox(height: 10),
              TextField(
                controller: rentPrice,
                keyboardType: TextInputType.number,
                decoration: buildInputDecoration(
                  'Rent Price (per hour)',
                  Icon(Icons.attach_money),
                ),
              ),
              SizedBox(height: 10),
              TextField(
                controller: licenseNumber,
                decoration: buildInputDecoration(
                  'License Number',
                  Icon(Icons.car_repair),
                ),
              ),
              SizedBox(height: 10),
              TextField(
                controller: location,
                decoration: buildInputDecoration(
                  'Location',
                  Icon(Icons.location_on),
                ),
              ),
              SizedBox(height: 10),
              DropdownButtonFormField<String>(
                decoration: buildInputDecoration(
                  'City',
                  Icon(Icons.location_city),
                ),
                value: selectedCity,
                items: cityName.map((value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: (String? newValue) {
                  setState(() {
                    selectedCity = newValue;
                  });
                },
              ),
              SizedBox(height: 10),
              DropdownButtonFormField<String>(
                decoration: buildInputDecoration(
                  'Wheel Drive',
                  Icon(Icons.drive_eta),
                ),
                value: selectedWheelDrive,
                items: wheelDriveMenu.map((value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: (String? newValue) {
                  setState(() {
                    selectedWheelDrive = newValue;
                  });
                },
              ),
              SizedBox(height: 10),
              DropdownButtonFormField<String>(
                decoration: buildInputDecoration(
                  'Number of Seats',
                  Icon(Icons.event_seat),
                ),
                value: selectedSeatNum,
                items: seatNum.map((value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: (String? newValue) {
                  setState(() {
                    selectedSeatNum = newValue;
                  });
                },
              ),
              SizedBox(height: 10),
              DropdownButtonFormField<String>(
                decoration: buildInputDecoration(
                  'Transmission Type',
                  Icon(Icons.settings),
                ),
                value: selectedTransType,
                items: TransmissionType.map((value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: (String? newValue) {
                  setState(() {
                    selectedTransType = newValue;
                  });
                },
              ),
              SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {
                  pickImage();
                },
                child: Text('Upload Car Image'),
              ),
              SizedBox(height: 10),
              imageUrl != '' ? Image.network(imageUrl) : SizedBox.shrink(),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  updateCarDetails();
                },
                child: Text('Update Car Details'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  InputDecoration buildInputDecoration(String hintText, Icon icon) {
    return InputDecoration(
      hintText: hintText,
      prefixIcon: icon,
      contentPadding: EdgeInsets.all(15),
      filled: true,
      fillColor: Colors.grey[200],
      border: OutlineInputBorder(
        borderSide: BorderSide.none,
        borderRadius: BorderRadius.circular(10),
      ),
    );
  }

  Future pickImage() async {
    final picker = ImagePicker();
    final pickedImage = await picker.pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      setState(() {
        isFile = true;
        fileImage = pickedImage;
      });
      await uploadImageToFirebase();
    }
  }

  Future uploadImageToFirebase() async {
    FirebaseStorage storage = FirebaseStorage.instance;
    Reference ref = storage.ref().child('car_images/${DateTime.now()}');
    UploadTask uploadTask = ref.putFile(File(fileImage.path));
    uploadTask.whenComplete(() async {
      String imageUrl = await ref.getDownloadURL();
      setState(() {
        this.imageUrl = imageUrl;
      });
    }).catchError((onError) {
      print(onError);
    });
  }

  void updateCarDetails() {
    // Create a new CarDetails object with the updated values
    ViewAddedVehicle updatedCarDetails = ViewAddedVehicle(
      manufacturer: Text(manufacturer.text),
      model: Text(model.text),
      makeyear: Text(makeyear.text),
      mileage: Text(mileage.text),
      gasConsumption: Text(gasConsumption.text),
      rentPrice: Text(rentPrice.text),
      licenseNumber: Text(licenseNumber.text),
      location: Text(location.text),
      city: Text(selectedCity!),
      wheelDrive: Text(selectedWheelDrive!),
      seats: Text(selectedSeatNum!),
      transmission: Text(selectedTransType!),
      imageUrl: imageUrl,
      hoursRented: hoursRented, // Add this line with the appropriate value
      timesRented: timesRented, // Add this line with the appropriate value
    );

    // ViewAddedVehicle updatedCarDetails = CarDetailsar(
    //   carManufacturer: manufacturer.text,
    //   carModel: model.text,
    //   carMakeYear: int.parse(makeyear.text),
    //   carMileage: int.parse(mileage.text),
    //   carGasConsumption: double.parse(gasConsumption.text),
    //   carRentPrice: double.parse(rentPrice.text),
    //   carLicenseNumber: licenseNumber.text,
    //   carLocation: location.text,
    //   carCity: selectedCity!,
    //   carWheelDrive: selectedWheelDrive!,
    //   carSeats: int.parse(selectedSeatNum!),
    //   carTransmission: selectedTransType!,
    //   carImageUrl: imageUrl,
    // );

    // TODO: Implement the logic to update the car details in your desired storage or database

    // After updating the car details, you can navigate to a new screen or perform any other actions
  }
}
