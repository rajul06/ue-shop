import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../../components/build_card_jual_barang.dart';
import '../../proses/proses_getData.dart';
import 'package:intl/intl.dart';

class HalamanHasilCari extends StatefulWidget {
  final String querySearch;
  final int owner;
  const HalamanHasilCari(
      {Key? key, required this.querySearch, required this.owner})
      : super(key: key);

  @override
  _HalamanHasilCariState createState() => _HalamanHasilCariState();
}

class _HalamanHasilCariState extends State<HalamanHasilCari> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  Future<List<dynamic>> fetchDataSearch(querySearch, selectedIndex) async {
    // Simulasi penundaan jaringan
    await Future.delayed(Duration(seconds: 2));

    // Ambil user id yang sedang login
    User? user = _auth.currentUser;
    String? _userId = user?.uid;
    String jenisAkun = '';

    if (selectedIndex == 0) {
      jenisAkun = "penampung";
    } else if (selectedIndex == 2) {
      jenisAkun = "masyarakat";
    }

    // Mengambil data dari firebase menggunakan fungsi dibawah, datanya yang dikembalikan sudah dirapikan
    return await getDataBarangSearch(querySearch, jenisAkun);
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
        title: Text(
          widget.querySearch,
        ),
      ),
      body: Padding(
        padding:
            EdgeInsets.only(top: 5.0, right: 19.0, bottom: 19.0, left: 19.0),
        child: FutureBuilder<List<dynamic>>(
          future: fetchDataSearch(widget.querySearch, widget.owner),
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
                    (index) => buildCardJualBarang(
                        context,
                        items[index]['namaBarang'],
                        currencyFormat.format(items[index]['hargaBarang']),
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
