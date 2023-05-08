import 'package:flutter/material.dart';
import 'package:ue_shop/pages/penampung/halaman_jual_barang_penampung.dart';

import '../pages/penampung/home_page_navbar.dart';

Future popUpUploadBarangPenampung(context) {
  return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return SimpleDialog(
          title: Text(
            'Berhasil',
            textAlign: TextAlign.center,
          ),
          contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 10.0),
          children: <Widget>[
            ElevatedButton(
              style: ElevatedButton.styleFrom(primary: Color(0xFF0095DA)),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => HalamanBeranda()));
              },
              child: Text("OK"),
            ),
          ],
        );
      });
}
