import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../components/pop_up_berhasil_tambah_barang_penampung.dart';

class JualBarangPenampung2 extends StatefulWidget {
  @override
  _JualBarangPenampung2State createState() => _JualBarangPenampung2State();
}

class _JualBarangPenampung2State extends State<JualBarangPenampung2> {
  // untuk membuka file explore hp dan mengupload gambar
  File? _selectedFile;
  String? _filePathStr;

  void _openFileExplorer() async {
    final result = await FilePicker.platform.pickFiles();
    if (result != null) {
      setState(() => _selectedFile = File(result.files.single.path!));
    }
  }

  // Variabel untuk menyimpan nilai input dari form
  String _namaBarang = '';
  int _hargaBarang = 0;
  String _kategori = '';
  String _deskripsi = '';
  int _beratBarang = 0;
  String _jasaPengiriman = '';
  String _metodePembayaran = '';

  // Pesan berhasil upload berhasil atau tidak
  String pesanUpload = '';

  // nilai error untuk masing-masing input
  String _hargaBarangMessage = 'Harga Barang';
  // Mendapatkan data user
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseStorage _storage = FirebaseStorage.instance;
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  Future uploadGambarBarang(File imageFile) async {
    // Fungsi untuk mengupload gambar form ke server atau melakukan tindakan lainnya
    User? user = _auth.currentUser;
    String imagePath =
        'barang_penampung/${user?.uid}/$_kategori/$_namaBarang.jpg';
    try {
      TaskSnapshot snapshot = await _storage.ref(imagePath).putFile(imageFile);
      String downloadUrl = await snapshot.ref.getDownloadURL();
      return downloadUrl;
    } on FirebaseException catch (e) {
      print(e);
    }
  }

  Future<void> tambahBarang() {
    // Fungsi tambah barang ke database firestore firebase
    return _db
        .collection('barang')
        .doc()
        .set({
          'nama_barang': _namaBarang,
          'harga_barang': _hargaBarang,
          'kategori': _kategori,
          'deskripsi': _deskripsi,
          'berat_barang': _beratBarang,
          'jasa_pengiriman': _jasaPengiriman,
          'metode_pembayaran': _metodePembayaran
        })
        .then((value) => print("User Added"))
        .catchError((error) => print("Failed to add user: $error"));
  }

  // validasi form sudah lengkap
  final _formKey = GlobalKey<FormState>();
  AutovalidateMode _autoValidateMode = AutovalidateMode.disabled;

  void _submitForm() {
    // Fungsi untuk mengirimkan data form ke server atau melakukan tindakan lainnya

    if (_formKey.currentState!.validate()) {
      // Simpan data ke database
      uploadGambarBarang(_selectedFile!);
      tambahBarang();
      popUpUploadBarangPenampung(context);
    } else {
      // Tampilkan pesan kesalahan pada setiap form yang belum diisi dengan benar
      setState(() {
        _autoValidateMode = AutovalidateMode.always;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text('Form Produk',
            style: TextStyle(
              fontSize: 18,
              fontFamily: 'InriaSans',
              fontWeight: FontWeight.bold,
              color: Colors.black,
            )),
        iconTheme: const IconThemeData(color: Colors.black),
        actions: [
          Padding(
            padding: const EdgeInsets.only(
              right: 20,
            ),
            child: TextButton(
              child: const Text(
                'Simpan',
                style: TextStyle(
                    color: Color(0xFF0095DA),
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'InriaSans'),
              ),
              onPressed: () {
                _submitForm();
              },
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          autovalidateMode: _autoValidateMode,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              SizedBox(
                height: 8.0,
              ),
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                const Text(
                  'Foto Barang',
                  style: TextStyle(
                      color: Colors.black,
                      fontFamily: 'InriaSans',
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold),
                ),
                TextButton(
                  child: const Text(
                    'Tambah',
                    style: TextStyle(
                        color: Color(0xFF0095DA),
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'InriaSans'),
                  ),
                  onPressed: () {
                    _openFileExplorer();
                  },
                ),
              ]),
              _selectedFile != null
                  ? Text(_selectedFile!.path,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                      style: TextStyle(
                          color: Color(0xFFAEAEAE),
                          fontFamily: 'InriaSans',
                          fontSize: 12.0))
                  : Text(''),
              SizedBox(
                height: 16.0,
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Judul Barang'),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Judul barang tidak boleh kosong';
                  }
                  return null;
                },
                onChanged: (value) {
                  setState(() {
                    _namaBarang = value;
                  });
                },
              ),
              const SizedBox(height: 16.0),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Harga Barang'),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Harga barang tidak boleh kosong';
                  }
                  return null;
                },
                onChanged: (value) {
                  try {
                    setState(() {
                      _hargaBarang = int.parse(value);
                    });
                  } catch (e) {
                    print('Masukkan harga barang salah');
                  }
                },
              ),
              const SizedBox(height: 16.0),
              Text(
                'Kategori',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'InriaSans'),
              ),
              SizedBox(
                height: 6.0,
              ),
              Row(
                children: <Widget>[
                  Radio(
                    value: 'TV/Monitor',
                    groupValue: _kategori,
                    onChanged: (value) {
                      setState(() {
                        _kategori = value!;
                      });
                    },
                  ),
                  const Text('TV/Monitor'),
                  Radio(
                    value: 'HP % Sejenisnya',
                    groupValue: _kategori,
                    onChanged: (value) {
                      setState(() {
                        _kategori = value!;
                      });
                    },
                  ),
                  const Text('   HP dan\nSejenisnya'),
                  Radio(
                    value: 'Lainnya',
                    groupValue: _kategori,
                    onChanged: (value) {
                      setState(() {
                        _kategori = value!;
                      });
                    },
                  ),
                  const Text('Lainnya'),
                ],
              ),
              const SizedBox(height: 10.0),
              TextFormField(
                decoration: InputDecoration(labelText: 'Deskripsi'),
                maxLines: 3,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Deskripsi tidak boleh kosong';
                  }
                  return null;
                },
                onChanged: (value) {
                  setState(() {
                    _deskripsi = value;
                  });
                },
              ),
              SizedBox(height: 16.0),
              TextFormField(
                decoration: InputDecoration(labelText: 'Berat Barang (gram)'),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Berat barang tidak boleh kosong';
                  }
                  return null;
                },
                onChanged: (value) {
                  try {
                    setState(() {
                      _beratBarang = int.parse(value);
                    });
                  } catch (e) {
                    print('Masukkan berat barang salah');
                  }
                },
              ),
              SizedBox(height: 16.0),
              Text('Jasa Pengiriman', style: TextStyle(fontSize: 16.0)),
              Row(
                children: <Widget>[
                  Radio(
                    value: 'JNE',
                    groupValue: _jasaPengiriman,
                    onChanged: (value) {
                      setState(() {
                        _jasaPengiriman = value!;
                      });
                    },
                  ),
                  Text('JNE'),
                ],
              ),
              SizedBox(height: 16.0),
              Text('Metode Pembayaran', style: TextStyle(fontSize: 16.0)),
              Row(
                children: <Widget>[
                  Radio(
                    value: 'COD',
                    groupValue: _metodePembayaran,
                    onChanged: (value) {
                      setState(() {
                        _metodePembayaran = value!;
                      });
                    },
                  ),
                  Text('COD'),
                ],
              ),
              SizedBox(height: 16.0),
            ],
          ),
        ),
      ),
    );
  }
}
