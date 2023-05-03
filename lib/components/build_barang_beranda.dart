import 'package:flutter/material.dart';

Widget buildCardBarang(String namaBarang, String hargaBarang, String lokasi,
    ImageProvider<Object> image, VoidCallback onPressed) {
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
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
            padding: EdgeInsets.all(10.0),
            width: 160,
            height: 170,
            decoration: const BoxDecoration(color: Color(0xFFF0F0F0)),
            child: Image(
              image: image,
              width: 111,
            )),
        Container(
            padding: EdgeInsets.only(
              left: 10,
              top: 5,
              right: 10,
              bottom: 10,
            ),
            width: 150,
            height: 85,
            decoration: const BoxDecoration(),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(namaBarang,
                  style: TextStyle(
                      fontFamily: 'InriaSans',
                      fontSize: 12.0,
                      fontWeight: FontWeight.normal)),
              Text(hargaBarang,
                  style: TextStyle(
                      fontFamily: 'InriaSans',
                      fontSize: 14.0,
                      fontWeight: FontWeight.bold)),
              SizedBox(
                height: 16.0,
              ),
              Text(lokasi,
                  style: TextStyle(
                      color: Color(0xFF404040),
                      fontFamily: 'InriaSans',
                      fontSize: 10.0,
                      fontWeight: FontWeight.normal))
            ]))
      ],
    ),
  );
}
