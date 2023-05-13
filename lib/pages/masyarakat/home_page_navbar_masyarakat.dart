import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ue_shop/pages/masyarakat/halaman_jual_barang_masyarakat.dart';
import 'package:ue_shop/pages/masyarakat/halaman_profil_masyarakat.dart';
import 'package:ue_shop/pages/penampung/halaman_beranda.dart';
import 'package:ue_shop/pages/penampung/halaman_jual_barang_penampung.dart';

import '../../components/custom_app_bar.dart';
import '../penampung/halaman_profil.dart';

class HalamanBerandaMasyarakat extends StatefulWidget {
  @override
  _HalamanBerandaMasyarakatState createState() =>
      _HalamanBerandaMasyarakatState();
}

class _HalamanBerandaMasyarakatState extends State<HalamanBerandaMasyarakat> {
  int _selectedIndex = 0;

  final List<String> _svgIcons = [
    'assets/icons/home_icon.svg',
    'assets/icons/jual_icon.svg',
    'assets/icons/profil_icon.svg',
  ];

  final List<Widget> _widgetOptions = [
    // Add your widget options here
    const HomePageBarangPenampung(),
    const HalamanJualBarangMasyarakat(),
    HalamanProfilMasyarakat(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: _selectedIndex == 0
          ? PreferredSize(
              preferredSize: const Size.fromHeight(kToolbarHeight - 1.0),
              child: AppBar(
                automaticallyImplyLeading: false,
                title: const CustomAppBar(
                  selectedIndex: 0,
                  showSearch: true,
                ),
              ),
            )
          : null,
      body: _widgetOptions[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Color.fromARGB(255, 237, 237, 237),
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/icons/home_icon.svg',
              color: _selectedIndex ==
                      _svgIcons.indexOf('assets/icons/home_icon.svg')
                  ? const Color(0xFF0095DA)
                  : const Color(0xFF404040),
              width: 24,
              height: 24,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/icons/jual_icon.svg',
              color: _selectedIndex ==
                      _svgIcons.indexOf('assets/icons/jual_icon.svg')
                  ? Color(0xFF0095DA)
                  : Color(0xFF404040),
              width: 24,
              height: 24,
            ),
            label: 'Jual',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/icons/profil_icon.svg',
              color: _selectedIndex ==
                      _svgIcons.indexOf('assets/icons/profil_icon.svg')
                  ? Color(0xFF0095DA)
                  : Color(0xFF404040),
              width: 24,
              height: 24,
            ),
            label: 'Profile',
          )
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}
