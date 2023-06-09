import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:ue_shop/pages/masyarakat/halaman_profil_masyarakat.dart';

class HalamanLoginMasyarakat extends StatefulWidget {
  @override
  _HalamanLoginMasyarakatState createState() => _HalamanLoginMasyarakatState();
}

class _HalamanLoginMasyarakatState extends State<HalamanLoginMasyarakat> {
  final TextEditingController _passwordController = TextEditingController();
  bool _passwordVisible = false;
  bool _isPasswordValid = true;

  void _togglePasswordVisibility() {
    setState(() {
      _passwordVisible = !_passwordVisible;
    });
  }

  // void _validatePassword(String value) {
  //   setState(() {
  //     _isPasswordValid = value.length >= 8;
  //   });
  // }

  // nyimpan error message
  String _errorMessage = '';

  void login(email, password) async {
    final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
    try {
      await firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
      setState(() {
        _errorMessage = '';
      });
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => ProfilePage()));
    } on FirebaseAuthException catch (error) {
      setState(() {
        _errorMessage = 'Email atau password yang anda masukkan salah';
      });
    }
  }

  // Nyimpan email dan password dari field email dan password
  String email = '';
  String password = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image(
              image: AssetImage('assets/images/logo_app.png'),
              width: 233,
              height: 233,
            ),
            Text(
              'Masuk',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF0095DA),
                  fontSize: 25),
            ),
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              Text(
                'Sebagai Masyarakat',
                style: TextStyle(
                    color: Color(0xFF9E9E9E),
                    fontFamily: 'InriaSans',
                    fontSize: 13.0,
                    fontWeight: FontWeight.bold),
              ),
              GestureDetector(
                child: Text('  Ganti',
                    style: TextStyle(
                        fontFamily: 'InriaSans',
                        fontSize: 13.0,
                        decoration: TextDecoration.underline,
                        color: Color(0xFF0095DA))),
              ),
            ]),
            Container(
              width: double.infinity,
              child: Text(
                _errorMessage,
                style: TextStyle(color: Colors.red),
                textAlign: TextAlign.center,
              ),
            ),
            TextField(
              onChanged: (value) {
                setState(() {
                  email = value;
                });
              },
              decoration: InputDecoration(
                labelText: 'Email',
                hintText: 'Enter your username/email',
              ),
            ),
            SizedBox(height: 20),
            TextField(
              controller: _passwordController,
              obscureText: !_passwordVisible,
              onChanged: (value) {
                setState(() {
                  password = value;
                });
              },
              decoration: InputDecoration(
                labelText: 'Password',
                hintText: 'Enter your password',
                suffixIcon: IconButton(
                  icon: Icon(
                    _passwordVisible ? Icons.visibility_off : Icons.visibility,
                    color: Colors.grey,
                  ),
                  onPressed: _togglePasswordVisibility,
                ),
              ),
            ),
            SizedBox(height: 16.0),
            SizedBox(
              width: 114,
              child: ElevatedButton(
                onPressed: () {
                  login(email, password);
                },
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  elevation: 5.0,
                  backgroundColor: Color(0xFF0095DA),
                ),
                child: Text(
                  'Login',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            SizedBox(height: 16.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Belum punya akun?',
                    style: TextStyle(
                        color: Color(0xFF9E9E9E),
                        fontFamily: 'InriaSans',
                        fontSize: 16.0)),
                GestureDetector(
                  
                  child: Text(' Daftar',
                      style: TextStyle(
                          fontFamily: 'InriaSans',
                          fontSize: 16.0,
                          decoration: TextDecoration.underline,
                          color: Color(0xFF0095DA))),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
