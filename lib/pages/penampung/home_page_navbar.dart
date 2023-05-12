import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ue_shop/pages/penampung/halaman_barang_bekas_masyarakat.dart';
import 'package:ue_shop/pages/penampung/halaman_beranda.dart';
import 'package:ue_shop/pages/penampung/halaman_jual_barang_penampung.dart';
import 'halaman_profil.dart';
import '../../components/custom_app_bar.dart';

class HalamanBeranda extends StatefulWidget {
  @override
  _HalamanBerandaState createState() => _HalamanBerandaState();
}

class _HalamanBerandaState extends State<HalamanBeranda> {
  int _selectedIndex = 0;

  final List<String> _svgIcons = [
    'assets/icons/home_icon.svg',
    'assets/icons/jual_icon.svg',
    'assets/icons/second_home.svg',
    'assets/icons/profil_icon.svg',
  ];

  final List<Widget> _widgetOptions = [
    // Add your widget options here
    const HomePageBarangPenampung(),
    const JualBarangPenampung(),
    const HomePageBarangMasyarakat(),
    ProfilePage(
        name: 'udin',
        imageUrl:
            'https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.flaticon.com%2Ffree-icon%2Fprofile_3135715&psig=AOvVaw3KasBrsps_roxsK-xRaOvI&ust=1682794672456000&source=images&cd=vfe&ved=0CBEQjRxqFwoTCPjK3uegzf4CFQAAAAAdAAAAABAE'),
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
      appBar: _selectedIndex == 0 || _selectedIndex == 2
          ? PreferredSize(
              preferredSize: const Size.fromHeight(kToolbarHeight - 1.0),
              child: AppBar(
                automaticallyImplyLeading: false,
                title: CustomAppBar(
                  selectedIndex: _selectedIndex,
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
              'assets/icons/second_home.svg',
              color: _selectedIndex ==
                      _svgIcons.indexOf('assets/icons/second_home.svg')
                  ? Color(0xFF0095DA)
                  : Color(0xFF404040),
              width: 24,
              height: 24,
            ),
            label: 'Barang\n Bekas',
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
