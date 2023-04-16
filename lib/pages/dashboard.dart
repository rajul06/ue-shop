import 'package:flutter/material.dart';

class DashboardPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF0095DA),
        title: Text('Dashboard'),
      ),
      backgroundColor: Colors.white,
      body: Center(
        child: Text('Welcome to Dashboard'),
      ),
    );
  }
}
