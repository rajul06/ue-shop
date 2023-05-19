import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:ue_shop/components/build_card_barang_pencarian.dart';
import 'package:ue_shop/pages/penampung/detail_barang.dart';
import '../../proses/proses_getData.dart';
import 'package:intl/intl.dart';

class HalamanTransaksiMasyarakat extends StatefulWidget {
  @override
  _HalamanTransaksiMasyarakatState createState() =>
      _HalamanTransaksiMasyarakatState();
}

class _HalamanTransaksiMasyarakatState
    extends State<HalamanTransaksiMasyarakat> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  Future<List<dynamic>> fetchDataTransaksi() async {
    // Simulasi penundaan jaringan
    await Future.delayed(Duration(seconds: 2));

    // Ambil user id yang sedang login
    User? user = _auth.currentUser;
    String? _userId = user?.uid;
    String jenisAkun = '';

    // Mengambil data dari firebase menggunakan fungsi dibawah, datanya yang dikembalikan sudah dirapikan
    return await getBarangBeliMasyarakat(_userId);
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
        backgroundColor: const Color(0xFF0095DA),
        title: Text(
          'Barang Pesanan',
          style: const TextStyle(fontFamily: 'InriaSans'),
        ),
      ),
      body: Padding(
        padding:
            EdgeInsets.only(top: 5.0, right: 19.0, bottom: 19.0, left: 19.0),
        child: FutureBuilder<List<dynamic>>(
          future: fetchDataTransaksi(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              // Ketika data masih dimuat, tampilkan indikator loading
              return CircularProgressIndicator();
            } else if (snapshot.hasError) {
              // Ketika terjadi error dalam pengambilan data
              return Text('Error: ${snapshot.error}');
            } else {
              // Ketika data telah berhasil diambil
              List items = snapshot.data!;
              return Wrap(
                spacing: 8.0,
                alignment: WrapAlignment.spaceBetween,
                children: List.generate(
                    items.length,
                    (index) => buildCardBarangPencarian(
                        context,
                        items[index]['namaBarang'],
                        items[index]['hargaBarang'],
                        items[index]['lokasi'],
                        items[index]['urlDownload'],
                        () {})),
              );
            }
          },
        ),
      ),
    );
  }
}
