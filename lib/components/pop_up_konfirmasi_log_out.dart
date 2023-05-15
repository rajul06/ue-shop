import 'package:flutter/material.dart';
import 'package:ue_shop/pages/masyarakat/login_page_masyarakat.dart';

void popUpKonfirmasiLogout(BuildContext context, logout) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return Center(
        child: AlertDialog(
          title: Text("Konfirmasi Logout", textAlign: TextAlign.center),
          content: Text("Apakah anda yakin ingin logout?",
              textAlign: TextAlign.center),
          actions: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () => Navigator.pop(context),
                  child: Text("Batal"),
                ),
                SizedBox(
                  width: 16,
                ),
                TextButton(
                  onPressed: () {
                    logout();
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (value) => HalamanLoginMasyarakat()));
                  },
                  child: Text("Logout"),
                ),
              ],
            ),
          ],
        ),
      );
    },
  );
}
