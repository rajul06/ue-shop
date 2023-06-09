import 'package:flutter/material.dart';
import 'package:ue_shop/pages/masyarakat/home_page_navbar_masyarakat.dart';

Future popUpUploadBarangMasyarakat(context) {
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
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => HalamanBerandaMasyarakat()));
              },
              child: Text("OK"),
            ),
          ],
        );
      });
}
