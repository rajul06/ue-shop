import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ue_shop/pages/halaman_jual_barang_penampung2.dart';
import '../components/build_card_jual_barang.dart';

class JualBarangPenampung extends StatefulWidget {
  const JualBarangPenampung({super.key});

  @override
  _JualBarangPenampung createState() => _JualBarangPenampung();
}

class _JualBarangPenampung extends State<JualBarangPenampung> {
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
        Padding(
          padding: EdgeInsets.all(19.0),
          child: Wrap(
              spacing: 13.0,
              alignment: WrapAlignment.spaceBetween,
              children: <Widget>[
                buildCardJualBarang(
                    context,
                    'Printer Epson',
                    'Rp.500.000',
                    'Banda Aceh',
                    const AssetImage('assets/images/printer.png'), () {
                  print('barang 1 ditekan');
                }),
                buildCardJualBarang(
                    context,
                    'Printer Epson',
                    'Rp.500.000',
                    'Banda Aceh',
                    const AssetImage('assets/images/printer.png'), () {
                  print('barang 2 ditekan');
                }),
                Container(
                  padding: EdgeInsets.all(10.0),
                  margin: const EdgeInsets.all(10.0),
                  width: 160,
                  height: 170,
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
                  child: Column(
                    children: [
                      SizedBox(
                        height: 15.0,
                      ),
                      IconButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      JualBarangPenampung2()));
                        },
                        icon: SvgPicture.asset('assets/icons/jual_barang.svg',
                            color: Color(0xFF0095DA)),
                        iconSize: 50.0,
                      ),
                      const SizedBox(height: 21.0),
                      const Text('Jual Barang\n      Bekas',
                          style: TextStyle(
                              color: Color(0xFF0095DA),
                              fontFamily: 'InriaSans',
                              fontSize: 14.0,
                              fontWeight: FontWeight.normal))
                    ],
                  ),
                )
              ]),
        ),
      ]),
    );
  }
}
