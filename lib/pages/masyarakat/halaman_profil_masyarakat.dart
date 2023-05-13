import 'package:flutter/material.dart';
import '../../components/pop_up_konfirmasi_log_out.dart';

class HalamanProfilMasyarakat extends StatefulWidget {
  @override
  _HalamanProfilMasyarakatState createState() =>
      _HalamanProfilMasyarakatState();
}

class _HalamanProfilMasyarakatState extends State<HalamanProfilMasyarakat> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 100),
              SizedBox(
                width: 200,
                height: 200,
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    CircleAvatar(
                      backgroundImage:
                          AssetImage('assets/images/jul_profile.jpg'),
                    ),
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: CircleAvatar(
                        backgroundColor: Colors.blue,
                        radius: 30,
                        child: IconButton(
                          onPressed: () {
                            // TODO: implement logic to change profile picture
                          },
                          icon: Icon(Icons.camera_alt, color: Colors.white),
                          iconSize: 40.0,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 35),
              Text(
                'Arie Irawan',
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 80),
              ElevatedButton.icon(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => EditProfilePage()),
                  );
                },
                icon: Icon(
                  Icons.person,
                  color: Colors.black,
                ),
                label: Text('Ubah Profil',
                    style: TextStyle(color: Colors.black, fontSize: 17)),
                style: ElevatedButton.styleFrom(
                  primary: Colors.white, // ubah warna latar belakang
                  elevation: 0, // set nilai elevation menjadi 0
                ),
              ),
              SizedBox(height: 16),
              ElevatedButton.icon(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ChangePasswordPage()),
                  );
                },
                icon: Icon(
                  Icons.key,
                  color: Colors.black,
                ),
                label: Text('Ubah Password',
                    style: TextStyle(color: Colors.black, fontSize: 17)),
                style: ElevatedButton.styleFrom(
                  primary: Colors.white,
                  elevation: 0, // set nilai elevation menjadi 0
                ),
              ),
              Spacer(),
              ElevatedButton.icon(
                onPressed: () {
                  popUpKonfirmasiLogout(context);
                  // TODO: implement logic to logout
                },
                icon: Icon(Icons.logout, color: Colors.red),
                label: Text('Logout',
                    style: TextStyle(color: Colors.red, fontSize: 17)),
                style: ElevatedButton.styleFrom(
                  primary: Colors.white,
                  elevation: 0,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class EditProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ubah Profil'),
      ),
      body: Center(
        child: Text('Ini adalah halaman untuk mengubah profil'),
      ),
    );
  }
}

class ChangePasswordPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ubah Password'),
      ),
      body: Center(
        child: Text('Ini adalah halaman untuk mengubah password'),
      ),
    );
  }
}
