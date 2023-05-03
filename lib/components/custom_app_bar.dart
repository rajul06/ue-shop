import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final bool showSearch;

  const CustomAppBar({super.key, required this.showSearch});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(1.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          if (showSearch)
            Expanded(
                flex: 1,
                child: Container(
                  height: 30,
                  width: 315,
                  color: Colors.blue,
                  child: TextField(
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      contentPadding: const EdgeInsets.symmetric(vertical: 1.0),
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
          IconButton(
              onPressed: () {},
              icon: SvgPicture.asset(
                'assets/icons/manage-setting.svg',
                width: 35,
                height: 35,
              ),
              alignment: Alignment.bottomCenter)
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(60.0);
}

String searchKey = '';
