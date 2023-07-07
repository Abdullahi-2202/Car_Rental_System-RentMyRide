// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, use_build_context_synchronously, non_constant_identifier_names

// import 'package:cargo/Profile.dart';

import 'package:rent_my_ride_s1/landing_page.dart';
import 'package:rent_my_ride_s1/reusable_widget/Custom_AppBar.dart';

import 'host_page.dart';
import 'explore_page.dart';
import 'login_page.dart';
import 'rent_page.dart';
import 'settings.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
// import 'package:cargo/contactus.dart';
// import 'package:cargo/payment.dart';
// import 'package:cargo/settings.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> with TickerProviderStateMixin {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  signOut() async {
    await _auth.signOut();
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => LoginPage()));
  }

  @override
  Widget build(BuildContext context) {
    // TabController tabController = TabController(length: 3, vsync: this);
    return DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: CarGoAppBar(),
          backgroundColor: Colors.white,
          body: Padding(
            padding: const EdgeInsets.only(top: 160, left: 15, right: 15),
            child: GridView.count(
                crossAxisCount: 3,
                crossAxisSpacing: 5.0,
                mainAxisSpacing: 8.0,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GestureDetector(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(0.0),
                            child: GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => LandingPage()));
                              },
                              child: Image.asset(
                                "assets/logo.jpg",
                                width: 70,
                                height: 70,
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          const Text("Start Renting"),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => LandingPage()));
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Flexible(
                            child: Image.asset(
                              "assets/payment.png",
                              width: 70,
                              height: 70,
                            ),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          const Text("Payments"),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => LandingPage()));
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            "assets/setting.png",
                            width: 70,
                            height: 70,
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          const Text("Settings"),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => LandingPage()));
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Flexible(
                            child: Image.asset(
                              "assets/contuct.png",
                              width: 70,
                              height: 70,
                            ),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          const Text("Contact Us"),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => LandingPage()));
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            "assets/profile.png",
                            width: 70,
                            height: 70,
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          const Text("Profile")
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => signOut()));
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            "assets/signout.png",
                            width: 70,
                            height: 70,
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          const Text("Sign Out")
                        ],
                      ),
                    ),
                  ),
                ]),
          ),
          bottomNavigationBar: CarGoCurvedNavigationBar(),
        ));
  }

  ElevatedButton SearchElevatedButton() {
    return ElevatedButton.icon(
      onPressed: () {},
      icon: Text("Search for a Location"),
      label: Icon(
        Icons.search,
        color: Colors.black,
        //  fontWeight: FontWeight.w700,
      ),
      style: ElevatedButton.styleFrom(
        minimumSize: Size(340, 50),
        textStyle: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 20,
          // fontWeight: FontWeight.bold,
          overflow: TextOverflow.fade,
        ),
        backgroundColor: Colors.white70,
        foregroundColor: Colors.black,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(90.0),
            side: BorderSide(color: Colors.black)),
      ),
    );
  }

  CurvedNavigationBar CarGoCurvedNavigationBar() {
    return CurvedNavigationBar(
      index: 3,
      backgroundColor: Color.fromARGB(255, 255, 255, 255),
      color: Colors.deepPurple,
      animationDuration: Duration(milliseconds: 200),
      onTap: (int index) {
        switch (index) {
          case 0:
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ExplorePage()),
            );
            break;
          case 1:
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => RentPage()),
            );
            break;
          case 2:
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Hostpage()),
            );
            break;
          case 3:
            // Navigator.push(
            //   context,
            //   MaterialPageRoute(builder: (context) => DeletePage()),
            // );
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Dashboard()),
            );
            break;
        }
      },
      items: const [
        Icon(Icons.explore, color: Colors.white),
        Icon(Icons.directions_car_sharp, color: Colors.white),
        Icon(Icons.car_rental, color: Colors.white),
        Icon(Icons.settings, color: Colors.white),
      ],
    );
  }

  // ignore: non_constant_identifier_names
  AppBar CarGoAppBarBack() {
    return AppBar(
      elevation: 0,
      backgroundColor: Colors.transparent,
      shadowColor: Colors.transparent,
      centerTitle: true,
      title: Padding(
        padding: const EdgeInsets.only(top: 7),
        child: Image.asset(
          'assets/logo.jpg',
          color: Colors.black,
          height: 120.0,
          width: 90.0,
        ),
      ),
    );
  }
}
