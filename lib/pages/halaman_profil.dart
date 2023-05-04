import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  final String name;
  final String imageUrl;

  ProfilePage({required this.name, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          CircleAvatar(
            backgroundImage: AssetImage('assets/images/jul_profile.jpg'),
            radius: 58,
          ),
          Text(
            name,
            style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.email),
              SizedBox(width: 8),
              Text('example@email.com'),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.phone),
              SizedBox(width: 8),
              Text('+1 (555) 555-1234'),
            ],
          ),
        ],
      ),
    );
  }
}
