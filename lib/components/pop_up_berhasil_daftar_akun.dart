import 'package:flutter/material.dart';
import 'package:ue_shop/pages/masyarakat/home_page_navbar_masyarakat.dart';
import 'package:ue_shop/pages/masyarakat/login_page_masyarakat.dart';
import 'package:ue_shop/pages/penampung/login_page.dart';

Future popUpBerhasilDaftarAkun(
    context, userId, namaLengkap, email, password, jenisAkun) {
  return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return SimpleDialog(
          title: Text(
            'Daftar Akun\n  Berhasil!',
            textAlign: TextAlign.center,
          ),
          contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 10.0),
          children: <Widget>[
            ElevatedButton(
              style: ElevatedButton.styleFrom(primary: Color(0xFF0095DA)),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => jenisAkun == 'penampung'
                            ? HalamanLoginPenampung()
                            : HalamanLoginMasyarakat()));
              },
              child: Text("OK"),
            ),
          ],
        );
      });
}
