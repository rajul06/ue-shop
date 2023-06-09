import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

Widget buildCardJualBarang(BuildContext context, String namaBarang,
    String hargaBarang, String lokasi, image, VoidCallback onPressed) {
  var currencyFormat = NumberFormat.currency(
    symbol: "Rp ",
    decimalDigits: 0,
    locale: "id_ID",
  );
  var hargaBarangFormat = hargaBarang;
  if (hargaBarang != '') {
    hargaBarangFormat = currencyFormat.format(hargaBarang);
  }
  return Container(
    margin: const EdgeInsets.all(10.0),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(10.0),
      color: Colors.white,
      boxShadow: [
        const BoxShadow(
          color: Colors.grey,
          blurRadius: 5.0,
          offset: Offset(0, 3),
        ),
      ],
    ),
    child: GestureDetector(
      onTap: onPressed,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
              padding: EdgeInsets.all(10.0),
              width: 160,
              height: 120,
              decoration: const BoxDecoration(color: Color(0xFFF0F0F0)),
              child: Image.network(
                image,
                width: 111,
              )),
          Container(
              padding: EdgeInsets.only(
                left: 10,
                top: 5,
                right: 10,
                bottom: 10,
              ),
              width: 160,
              height: 60,
              decoration: const BoxDecoration(),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(hargaBarangFormat,
                        style: TextStyle(
                            fontFamily: 'InriaSans',
                            fontSize: 12.0,
                            fontWeight: FontWeight.normal)),
                    Text(hargaBarang,
                        style: TextStyle(
                            fontFamily: 'InriaSans',
                            fontSize: 14.0,
                            fontWeight: FontWeight.bold))
                  ]))
        ],
      ),
    ),
  );
}
