import 'package:flutter/material.dart';

class DashboardPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // automaticallyImplyLeading: false,
        title: Text('Nama Aplikasi'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              // aksi yang ingin dilakukan ketika tombol search ditekan
            },
          ),
          IconButton(
            icon: Icon(Icons.settings),
            onPressed: () {
              // aksi yang ingin dilakukan ketika tombol pengaturan ditekan
            },
          ),
          IconButton(
            icon: Icon(Icons.notifications),
            onPressed: () {
              // aksi yang ingin dilakukan ketika tombol notifikasi ditekan
            },
          ),
        ],
      ),
      backgroundColor: Colors.white,
      body: Center(
        child: Text('Welcome to Dashboard'),
      ),
    );
  }
}
