import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ue_shop/pages/penampung/halaman_pencarian.dart';

class CustomAppBar extends StatefulWidget implements PreferredSizeWidget {
  @override
  _CustomAppBarState createState() => _CustomAppBarState();
  final bool showSearch;
  final selectedIndex;
  const CustomAppBar(
      {super.key, required this.showSearch, required this.selectedIndex});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => throw UnimplementedError();
}

class _CustomAppBarState extends State<CustomAppBar> {
  String _querySearch = '';

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(1.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          if (true)
            Expanded(
                flex: 1,
                child: Container(
                  height: 30,
                  width: 315,
                  color: Colors.blue,
                  child: TextField(
                    onChanged: (value) {
                      setState(() {
                        _querySearch = value;
                      });
                    },
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      contentPadding: const EdgeInsets.symmetric(vertical: 1.0),
                      suffixIcon: GestureDetector(
                        onTap: () {
                          if (_querySearch != '') {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => HalamanHasilCari(
                                          querySearch: _querySearch,
                                          owner: widget.selectedIndex,
                                        )));
                          }
                        },
                        child: Icon(
                          Icons.search,
                          color: Color(0xFF404040),
                        ),
                      ),
                      prefixIcon: SvgPicture.asset(
                        'assets/icons/manage-search-rounded.svg',
                        height: 24,
                      ),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: const BorderSide(
                            color: Color(0xFFAEAEAE),
                            width: 1.0,
                          )),
                      hintText: 'Cari di UEShop',
                      hintStyle: const TextStyle(
                        fontFamily: 'InriaSans',
                        color: Color(0xFF404040),
                      ),
                    ),
                    style: const TextStyle(
                      fontFamily: 'InriaSans',
                      color: Color(0xFF404040),
                    ),
                  ),
                )),
          IconButton(
              onPressed: () {},
              icon: SvgPicture.asset('assets/icons/manage-notification.svg',
                  width: 20, height: 23)),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(60.0);
}

String searchKey = '';
