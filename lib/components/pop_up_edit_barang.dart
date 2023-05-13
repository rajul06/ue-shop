import 'package:flutter/material.dart';
import 'package:ue_shop/pages/masyarakat/home_page_navbar_masyarakat.dart';

Future popUpEditBarangMasyarakat(context) {
  return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return SimpleDialog(
          contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 10.0),
          children: <Widget>[
            Column(
              children: [
                Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(primary: Color(0xFF0095DA)),
                    onPressed: () {},
                    child: Text("Edit"),
                  ),
                  SizedBox(
                    width: 16.0,
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(primary: Colors.red),
                    onPressed: () {},
                    child: Text("Hapus"),
                  ),
                ]),
                ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    style: ElevatedButton.styleFrom(primary: Colors.white),
                    child: const Text(
                      'Batal',
                      style: TextStyle(
                          color: Color(0xFF0095DA),
                          fontFamily: 'InriaSans',
                          fontWeight: FontWeight.bold),
                    ))
              ],
            )
          ],
        );
      });
}
