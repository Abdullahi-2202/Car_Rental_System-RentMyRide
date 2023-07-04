import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  final String userName;
  final String userEmail;

  ProfilePage({required this.userName, required this.userEmail});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
        backgroundColor: Colors.deepPurple,
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              'assets/logo.jpg',
              width: 270,
              height: 200,
            ),
            SizedBox(height: 20),
            Text(
              'Welcome Dear User',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 30),
            ListTile(
              leading: Icon(Icons.person),
              title: Text('Rayhan'),
              subtitle: Text(userName),
            ),
            ListTile(
              leading: Icon(Icons.email),
              title: Text('rayhan@gmail.com'),
              subtitle: Text(userEmail),
            ),
          ],
        ),
      ),
    );
  }
}
