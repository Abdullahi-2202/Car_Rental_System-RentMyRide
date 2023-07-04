import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactUsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Contact Us'),
        backgroundColor: Colors.deepPurple,
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/logo.jpg',
              width: 270,
              height: 200,
            ),
            SizedBox(height: 16),
            Text(
              'For any inquiries or support, please feel free to contact us:',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 16),
            ListTile(
              leading: Icon(Icons.mail),
              title: Text('Email'),
              subtitle: Text('rayhapon26@gmail.com'),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.phone),
              title: Text('Phone'),
              subtitle: Text('+01161123454'),
              onTap: () {
                // Handle phone tapping action
              },
            ),
            ListTile(
              leading: Icon(Icons.location_on),
              title: Text('Address'),
              subtitle:
                  Text('Skudai, Universiti Teknologi Malaysia, Johor Bahru'),
              onTap: () {
                // Handle address tapping action
              },
            ),
          ],
        ),
      ),
    );
  }
}
