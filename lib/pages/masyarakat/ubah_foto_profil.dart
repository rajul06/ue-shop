import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class ChangeProfilePicturePage extends StatefulWidget {
  @override
  _ChangeProfilePicturePageState createState() => _ChangeProfilePicturePageState();
}

class _ChangeProfilePicturePageState extends State<ChangeProfilePicturePage> {
  File? _imageFile;

Future<void> _pickImage(ImageSource source) async {
  final pickedFile = await ImagePicker().pickImage(source: source);
  if (pickedFile != null) {
    setState(() {
      _imageFile = File(pickedFile.path);
    });
  }
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ubah Foto Profil'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 50),
            CircleAvatar(
              radius: 90,
              backgroundImage: _imageFile != null ? FileImage(_imageFile!) : null,
              child: _imageFile == null ? Icon(Icons.person, size: 90) : null,
            ),
            SizedBox(height: 50),
            ElevatedButton(
              onPressed: () => _pickImage(ImageSource.camera),
              child: Text('Ambil Foto dari Kamera'),
                style: ElevatedButton.styleFrom(
                  fixedSize: Size(180, 30),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
            ),
            SizedBox(height: 8),
            ElevatedButton(
              onPressed: () => _pickImage(ImageSource.gallery),
              child: Text('Pilih Foto dari Galeri'),
                style: ElevatedButton.styleFrom(
                  fixedSize: Size(180, 30),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
            ),
            SizedBox(height: 8),

            Spacer(),
            ElevatedButton(
              onPressed: () {
                // TODO: Implement save logic
                Navigator.pop(context);
              },
              child: Text('Simpan'),
                  style: ElevatedButton.styleFrom(
                  fixedSize: Size(400, 30),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
            ),
            SizedBox(height: 15),
          ],
        ),
      ),
    );
  }
}