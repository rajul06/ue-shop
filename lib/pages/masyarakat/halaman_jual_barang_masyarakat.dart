import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ue_shop/components/build_card_jual_barang_masyarakat.dart';
import 'package:ue_shop/pages/penampung/detail_barang.dart';
import '../../components/build_card_jual_barang.dart';
import '../../proses/proses_getData.dart';
import 'package:intl/intl.dart';

import 'halaman_jual_barang_masyarakat2.dart';

class HalamanJualBarangMasyarakat extends StatefulWidget {
  const HalamanJualBarangMasyarakat({super.key});

  @override
  _HalamanJualBarangPenampung createState() => _HalamanJualBarangPenampung();
}

class _HalamanJualBarangPenampung extends State<HalamanJualBarangMasyarakat> {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<List<dynamic>> fetchData(jenisAkun) async {
    // Simulasi penundaan jaringan
    await Future.delayed(Duration(seconds: 2));

    // Ambil user id yang sedang login
    User? user = _auth.currentUser;
    String? _userId = user?.uid;

    // Mengambil data dari firebase menggunakan fungsi dibawah, datanya yang dikembalikan sudah dirapikan
    return await getDataBarangSatuUser(_userId, jenisAkun);
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        SizedBox(height: 20),
        Padding(
          padding: EdgeInsets.only(left: 21.0, right: 8.0),
          child: Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                CircleAvatar(
                  backgroundColor: Color(0xFF0095DA),
                  backgroundImage: AssetImage('assets/images/jul_profile.jpg'),
                  radius: 58,
                ),
                SizedBox(
                  width: 14.0,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Udin',
                        textAlign: TextAlign.start,
                        style:
                            TextStyle(fontFamily: 'InriaSans', fontSize: 18.0)),
                    Row(
                      children: [
                        const Text('Penampung',
                            style: TextStyle(
                              fontFamily: 'InriaSans',
                              fontSize: 14.0,
                            )),
                        SizedBox(
                          width: 7.0,
                        ),
                        SvgPicture.asset(
                          'assets/icons/location_icon.svg',
                          width: 8,
                        ),
                        SizedBox(
                          width: 3.0,
                        ),
                        const Text('Banda Aceh',
                            style: TextStyle(
                              fontFamily: 'InriaSans',
                              fontSize: 12,
                              color: Color(0xFF808080),
                            )),
                      ],
                    )
                  ],
                )
              ],
            ),
          ),
        ),
        const SizedBox(height: 38.5),
        SizedBox(
          height: 3.0,
          width: double.infinity,
          child: Container(
            decoration: const BoxDecoration(color: Color(0xFFD9D9D9)),
          ),
        ),
        GestureDetector(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => HalamanJualBarangMasyarakat2()));
          },
          child: Container(
            padding: EdgeInsets.all(10.0),
            margin: const EdgeInsets.all(10.0),
            width: double.infinity,
            height: 50,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              color: Colors.white,
              boxShadow: [
                const BoxShadow(
                  color: Color(0xFFD9D9D9),
                  blurRadius: 5.0,
                  offset: Offset(0, 0),
                )
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  'assets/icons/jual_barang.svg',
                  width: 25,
                ),
                const SizedBox(
                  width: 20,
                ),
                const Text('Jual Barang Bekas',
                    style: TextStyle(
                        color: Color(0xFF0095DA),
                        fontFamily: 'InriaSans',
                        fontSize: 14.0,
                        fontWeight: FontWeight.normal))
              ],
            ),
          ),
        ),
        Padding(
          padding:
              EdgeInsets.only(top: 5.0, right: 19.0, bottom: 19.0, left: 19.0),
          child: FutureBuilder<List<dynamic>>(
            future: fetchData('masyarakat'),
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
                      (index) => buildCardJualBarangMasyarakat(
                              context,
                              items[index]['namaBarang'],
                              items[index]['lokasi'],
                              items[index]['urlDownload'], () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => HalamanDetailBarang(
                                  namaBarang: items[index]['namaBarang'],
                                  gambarBarang: items[index]['urlDownload'],
                                  hargaBarang: items[index]['hargaBarang'],
                                  deskripsiBarang: items[index]['deskripsi'],
                                ),
                              ),
                            );
                          })),
                );
              }
            },
          ),
        ),
      ]),
    );
  }
}
