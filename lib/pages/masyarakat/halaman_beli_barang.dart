import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:ue_shop/proses/proses_tambah_barang.dart';
import '../../components/pop_up_konfirmasi_beli_barang.dart';
import '../../components/pop_up_konfirmasi_log_out.dart';
import 'package:intl/intl.dart';

class HalamanBeliBarang extends StatefulWidget {
  @override
  _HalamanBeliBarangState createState() => _HalamanBeliBarangState();

  final String namaBarang;
  final String gambarBarang;
  final hargaBarang;
  final String deskripsiBarang;
  final String idUser;
  final String jasaPengiriman;
  final String metodePembayaran;
  final String idDokumen;

  HalamanBeliBarang(
      {Key? key,
      required this.idDokumen,
      required this.namaBarang,
      required this.gambarBarang,
      required this.hargaBarang,
      required this.deskripsiBarang,
      required this.idUser,
      required this.jasaPengiriman,
      required this.metodePembayaran})
      : super(key: key);
}

class _HalamanBeliBarangState extends State<HalamanBeliBarang> {
  String _alamat = '';
  String _pengiriman = 'JNE';
  String _pembayaran = 'COD';
  int _totalHarga = 0;
  int _ongkir = 0;
  int _totalPembayaran = 0;
  String? idPembeli;

  // mendapatkan instansi atau informasi database firebase
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseStorage _storage = FirebaseStorage.instance;
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  void _hitungTotalPembayaran(hargaBarang) {
    setState(() {
      _totalPembayaran = hargaBarang + _ongkir;
    });
  }

  @override
  void initState() {
    super.initState();

    _totalHarga = widget.hargaBarang;
    _hitungTotalPembayaran(_totalHarga);
  }

  void lanjutkanPembayaran() {
    User? user = _auth.currentUser;
    idPembeli = user?.uid;
    popUpKonfirmasiBeliBarang(
        context,
        _auth,
        _storage,
        _db,
        widget.idUser,
        widget.namaBarang,
        idPembeli,
        widget.gambarBarang,
        widget.jasaPengiriman,
        widget.metodePembayaran,
        widget.idDokumen,
        hargaBarang: widget.hargaBarang);
  }

  @override
  Widget build(BuildContext context) {
    var currencyFormat = NumberFormat.currency(
      symbol: "Rp ",
      decimalDigits: 0,
      locale: "id_ID",
    );
    return Scaffold(
      appBar: AppBar(
        title: Text('Beli Barang', style: TextStyle(color: Colors.black)),
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
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Barang yang dibeli',
              style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8.0),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 80.0,
                  height: 80.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.0),
                    image: DecorationImage(
                      image: NetworkImage(widget.gambarBarang),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SizedBox(width: 16.0),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.namaBarang,
                        style: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 4.0),
                      Text(
                        currencyFormat.format(widget.hargaBarang),
                        style:
                            TextStyle(fontSize: 14.0, color: Colors.grey[600]),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 24.0),
            Text(
              'Alamat Pengiriman',
              style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8.0),
            TextField(
              decoration: InputDecoration(
                hintText: 'Alamat pengiriman',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.multiline,
              maxLines: null,
              onChanged: (value) {
                setState(() {
                  _alamat = value;
                });
              },
            ),
            SizedBox(height: 24.0),
            Text(
              'Jasa Pengiriman',
              style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8.0),
            DropdownButton<String>(
              value: _pengiriman,
              onChanged: (value) {
                setState(() {
                  _pengiriman = value!;
                  _ongkir = _pengiriman == 'JNE' ? 15000 : 20000;
                  _hitungTotalPembayaran(widget.hargaBarang);
                });
              },
              items: <String>['JNE'].map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
            SizedBox(height: 24.0),
            Text(
              'Metode Pembayaran',
              style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8.0),
            DropdownButton<String>(
              value: _pembayaran,
              onChanged: (value) {
                setState(() {
                  _pembayaran = value!;
                });
              },
              items: <String>['COD'].map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
            SizedBox(height: 24.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Total Harga',
                  style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
                ),
                Text(
                  currencyFormat.format(widget.hargaBarang),
                  style: TextStyle(fontSize: 16.0),
                ),
              ],
            ),
            SizedBox(height: 8.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Ongkos Kirim',
                  style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
                ),
                Text(
                  'Rp $_ongkir',
                  style: TextStyle(fontSize: 16.0),
                ),
              ],
            ),
            Divider(thickness: 1.0, height: 24.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Total Pembayaran',
                  style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
                ),
                Text(
                  currencyFormat.format(_totalPembayaran),
                  style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            SizedBox(height: 150),
            Align(
              alignment: Alignment.bottomCenter,
              child: ElevatedButton(
                onPressed: () {
                  lanjutkanPembayaran();
                },
                child: Text('Lakukan Pembayaran'),
                style: ElevatedButton.styleFrom(
                  fixedSize: Size(400, 30),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
