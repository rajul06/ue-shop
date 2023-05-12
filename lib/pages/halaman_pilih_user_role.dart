import 'package:flutter/material.dart';
import 'package:ue_shop/pages/penampung/login_page.dart';
import 'masyarakat/login_page_masyarakat.dart';

class HalamanPilihUser extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Align(
        alignment: Alignment.topCenter,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image(
              image: AssetImage('assets/images/logo_app.png'),
              width: 233,
              height: 233,
            ),
            ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(
                  Colors.white,
                ),
                minimumSize: MaterialStateProperty.all(Size(250, 36)),
                shape: MaterialStateProperty.all(RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                )),
                side: MaterialStateProperty.resolveWith((states) {
                  return BorderSide(
                    color: states.contains(MaterialState.disabled)
                        ? Colors.grey
                        : Color(0xFF0095DA),
                    width: 1,
                  );
                }),
              ),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => HalamanLoginPenampung()));
              },
              child: const Text(
                'Penampung',
                style: TextStyle(
                  fontFamily: 'InriaSans',
                  color: Color(0xFF0095DA),
                ),
              ),
            ),
            const SizedBox(height: 16), // Jarak antara tombol
            ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(
                  Color(0xFF0095DA),
                ),
                minimumSize: MaterialStateProperty.all(Size(250, 36)),
                shape: MaterialStateProperty.all(RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                )),
              ),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => HalamanLoginMasyarakat()));
              },
              child: const Text(
                'Masyarakat',
                style: TextStyle(
                  fontFamily: 'InriaSans',
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
