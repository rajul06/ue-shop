import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:ue_shop/components/pop_up_edit_barang.dart';
import 'package:ue_shop/pages/masyarakat/halaman_beli_barang.dart';

class HalamanDetailBarang extends StatelessWidget {
  final String namaBarang;
  final String gambarBarang;
  final hargaBarang;
  final String deskripsiBarang;
  final String idUser;
  final String jasaPengiriman;
  final String metodePembayaran;
  final bool showEditButton;
  final String idDokumen;

  const HalamanDetailBarang({
    Key? key,
    required this.idDokumen,
    required this.namaBarang,
    required this.gambarBarang,
    required this.hargaBarang,
    required this.deskripsiBarang,
    required this.idUser,
    required this.jasaPengiriman,
    required this.metodePembayaran,
    required this.showEditButton,
  }) : super(key: key);

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
        actions: [
          showEditButton
              ? Padding(
                  padding: EdgeInsets.only(left: 16.0),
                  child: TextButton(
                      onPressed: () {
                        popUpEditBarangMasyarakat(context);
                      },
                      child: showEditButton
                          ? const Text(
                              'Edit',
                              style: TextStyle(
                                  fontFamily: 'InriaSans',
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18.0,
                                  color: Color(0xFF0095DA)),
                            )
                          : SizedBox()),
                )
              : SizedBox()
        ],
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
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => HalamanBeliBarang(
                                idDokumen: idDokumen,
                                namaBarang: namaBarang,
                                hargaBarang: hargaBarang,
                                gambarBarang: gambarBarang,
                                deskripsiBarang: deskripsiBarang,
                                idUser: idUser,
                                jasaPengiriman: jasaPengiriman,
                                metodePembayaran: metodePembayaran,
                              )));
                },
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
