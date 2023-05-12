import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class HalamanDetailBarang extends StatelessWidget {
  final String namaBarang;
  final String gambarBarang;
  final String hargaBarang;
  final String deskripsiBarang;

  const HalamanDetailBarang(
      {Key? key,
      required this.namaBarang,
      required this.gambarBarang,
      required this.hargaBarang,
      required this.deskripsiBarang})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var currencyFormat = NumberFormat.currency(
      symbol: "Rp ",
      decimalDigits: 0,
      locale: "id_ID",
    );
    var hargaBarangFormat = hargaBarang;
    if (hargaBarang != '') {
      hargaBarangFormat = currencyFormat.format(hargaBarang);
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(namaBarang,
            style: TextStyle(fontFamily: 'InriaSans', color: Colors.black)),
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(
              gambarBarang,
              height: 300,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            Divider(
              color: Colors.blue[500],
              thickness: 25,
              height: 10,
              indent: 0,
              endIndent: 0,
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    hargaBarangFormat,
                    style: TextStyle(
                        fontFamily: 'InriaSans',
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 5),
                  Text(
                    namaBarang,
                    style: TextStyle(fontFamily: 'InriaSans', fontSize: 16),
                  ),
                  SizedBox(height: 50),
                  Text(
                    'Deskripsi',
                    style: TextStyle(
                        fontFamily: 'InriaSans',
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 5),
                  Text(
                    deskripsiBarang,
                    style: TextStyle(fontFamily: 'InriaSans', fontSize: 16),
                    textAlign: TextAlign.justify,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Container(
          height: 50,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed: () {},
                child: Text(
                  'Hubungi Penjual',
                  style: TextStyle(
                    fontFamily: 'InriaSans',
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  fixedSize: Size(180, 30),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: () {},
                child: Text(
                  'Beli',
                  style: TextStyle(
                    fontFamily: 'InriaSans',
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  fixedSize: Size(180, 30),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
