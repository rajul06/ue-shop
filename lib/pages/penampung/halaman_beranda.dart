import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ue_shop/components/build_barang_beranda.dart';
import '../../proses/proses_getData.dart';
import 'detail_barang.dart';
import 'package:intl/intl.dart';

class HomePageBarangPenampung extends StatelessWidget {
  Future<List<dynamic>> fetchData() async {
    // Simulasi penundaan jaringan
    await Future.delayed(Duration(seconds: 2));

    // Mengambil data dari firebase menggunakan fungsi dibawah, datanya yang dikembalikan sudah dirapikan
    return await getDataBarang('penampung');
  }

  static const kategoriTitleStyle = TextStyle(
      fontFamily: 'InriaSans',
      fontWeight: FontWeight.bold,
      fontSize: 18,
      color: Colors.black);

  const HomePageBarangPenampung({super.key});

  // Widget untuk buat kategori bisa ditekan
  Widget _buildCategoryButton(
      String label, ImageProvider<Object> image, VoidCallback onPressed) {
    return Expanded(
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          primary: const Color.fromRGBO(255, 255, 255, 0),
          onPrimary: Colors.black,
          padding: const EdgeInsets.all(8),
          elevation: 0,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: double.infinity,
              height: 96,
              child: Image(
                image: image,
                fit: BoxFit.contain,
              ),
            ),
            const SizedBox(height: 8),
            Text(label, textAlign: TextAlign.center),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    var currencyFormat = NumberFormat.currency(
      symbol: "Rp ",
      decimalDigits: 0,
      locale: "id_ID",
    );
    return SingleChildScrollView(
      child: Column(children: <Widget>[
        Stack(children: <Widget>[
          SvgPicture.asset(
            'assets/images/images_svg/bg_kategori.svg',
            height: 220,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0), // use constant padding value
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const Text(
                  'Kategori',
                  style: kategoriTitleStyle,
                ),
                SizedBox(
                    height: null,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        _buildCategoryButton(
                          'TV/Monitor',
                          const AssetImage(
                              'assets/images/kategori_tv_monitor.png'),
                          () {
                            print('Gambar TV di-tap');
                            // tambahkan aksi lain yang diinginkan di sini
                          },
                        ),
                        const SizedBox(width: 16),
                        _buildCategoryButton(
                          'Handphone dan sejenisnya',
                          const AssetImage('assets/images/kategori_hp.png'),
                          () {
                            print('Gambar HP di-tap');
                            // tambahkan aksi lain yang diinginkan di sini
                          },
                        ),
                        const SizedBox(width: 16),
                        _buildCategoryButton(
                          'Perlengkapan Rumah tangga',
                          const AssetImage(
                              'assets/images/kategori_perlengkapan_rumah_tangga.png'),
                          () {
                            print('Gambar Kulkas di-tap');
                            // tambahkan aksi lain yang diinginkan di sini
                          },
                        ),
                      ],
                    ))
              ],
            ),
          )
        ]),
        Stack(children: [
          SizedBox(
              height: 20,
              width: double.infinity,
              child: Container(
                decoration: const BoxDecoration(color: Color(0xFF0095DA)),
              )),
          Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: SizedBox(
                  height: 10,
                  width: double.infinity,
                  child: Container(
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10),
                          topRight: Radius.circular(10)),
                    ),
                  )))
        ]),
        Padding(
            padding: const EdgeInsets.only(
              left: 15,
              right: 8.0,
              top: 0.0,
              bottom: 8.0,
            ),
            child: Container(
              decoration: const BoxDecoration(),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    const Text(
                      'Rekomendasi',
                      style: kategoriTitleStyle,
                    ),
                    const SizedBox(
                      height: 10.0,
                      width: double.infinity,
                    ),
                    FutureBuilder<List<dynamic>>(
                      future: fetchData(),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          // Ketika data masih dimuat, tampilkan indikator loading
                          return CircularProgressIndicator();
                        } else if (snapshot.hasError) {
                          // Ketika terjadi error dalam pengambilan data
                          return Text('Error: ${snapshot.error}');
                        } else {
                          // Ketika data telah berhasil diambil
                          List items = snapshot.data!;
                          return Wrap(
                            spacing: 15.0,
                            alignment: WrapAlignment.spaceBetween,
                            children: List.generate(
                                items.length,
                                (index) => buildCardBarang(
                                        context,
                                        items[index]['namaBarang'],
                                        items[index]['hargaBarang'],
                                        items[index]['lokasi'],
                                        items[index]['urlDownload'], () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              HalamanDetailBarang(
                                            namaBarang: items[index]
                                                ['namaBarang'],
                                            gambarBarang: items[index]
                                                ['urlDownload'],
                                            hargaBarang: items[index]
                                                ['hargaBarang'],
                                            deskripsiBarang: items[index]
                                                ['deskripsi'],
                                          ),
                                        ),
                                      );
                                    })),
                          );
                        }
                      },
                    ),
                  ]),
            ))
      ]),
    );
  }
}
