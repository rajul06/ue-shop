import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:ue_shop/components/pop_up_berhasil_daftar_akun.dart';

class HalamanDaftarAkun extends StatefulWidget {
  @override
  _HalamanDaftarAkunState createState() => _HalamanDaftarAkunState();
}

class _HalamanDaftarAkunState extends State<HalamanDaftarAkun> {
  // data untuk daftar akun
  String _email = '';
  String _password = '';
  String _confirmPassword = '';
  String _role = '';

  // menyimpan pesan error
  String _errorMessage = '';

  // pembangkit validasi form
  final _formKey = GlobalKey<FormState>();
  AutovalidateMode _autoValidateMode = AutovalidateMode.disabled;

  // instance firebase
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<void> daftarAkunPenampung(
      String email, String password, String role) async {
    try {
      if (_formKey.currentState!.validate()) {
        UserCredential userCredential =
            await _auth.createUserWithEmailAndPassword(
          email: email,
          password: password,
        );
        // Menyimpan atribut role pada akun pengguna
        await userCredential.user?.updateDisplayName(role);
        popUpBerhasilDaftarAkun(context);
      } else {
        setState(() {
          _autoValidateMode = AutovalidateMode.always;
        });
      }
      // Opsional: Menyimpan atribut role pada database Firestore atau Realtime Database
      // ...

      // Navigasi ke halaman berikutnya setelah berhasil mendaftar
      // ...
    } catch (e) {
      if ('[firebase_auth/email-already-in-use] The email address is already in use by another account.' ==
          e.toString()) {
        setState(() {
          _errorMessage = 'Email Address telah terdaftar oleh akun lain';
        });
      } else {
        print(e);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Register'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          autovalidateMode: _autoValidateMode,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Radio(
                    value: 'penampung',
                    groupValue: _role,
                    onChanged: (value) {
                      setState(() {
                        _role = value!;
                      });
                    },
                  ),
                  const Text(
                    'Penampung',
                    style: TextStyle(fontFamily: 'InriaSans', fontSize: 16.0),
                  ),
                  Radio(
                    value: 'masyarakat',
                    groupValue: _role,
                    onChanged: (value) {
                      setState(() {
                        _role = value!;
                      });
                    },
                  ),
                  const Text(
                    'Masyarakat',
                    style: TextStyle(fontFamily: 'InriaSans', fontSize: 16.0),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                width: double.infinity,
                child: Text(
                  _errorMessage,
                  style: TextStyle(color: Colors.red),
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(
                height: 5,
              ),
              TextFormField(
                onChanged: (value) => setState(() {
                  _email = value;
                }),
                decoration: InputDecoration(
                  labelText: 'Email',
                ),
              ),
              SizedBox(height: 16.0),
              TextFormField(
                onChanged: (value) => setState(() {
                  _password = value;
                }),
                decoration: InputDecoration(
                  labelText: 'Password',
                ),
                obscureText: true,
              ),
              SizedBox(height: 16.0),
              TextFormField(
                onChanged: (value) => setState(() {
                  _confirmPassword = value;
                }),
                decoration: InputDecoration(
                  labelText: 'Confirm Password',
                ),
                obscureText: true,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter your password again';
                  }
                  if (value != _password) {
                    return 'Password does not match';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: () {
                  daftarAkunPenampung(_email, _password, _role);
                },
                child: Text('Daftar'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
