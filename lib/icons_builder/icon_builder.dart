import 'package:flutter/material.dart';

Widget _buildIconBadge(
  IconData icon,
  String badgeText,
  Color badgeColor,
) {
  return Stack(
    children: <Widget>[
      Icon(
        icon,
        size: 50.0,
      ),
      Positioned(
        top: 2.0,
        right: 4.0,
        child: Container(
          padding: EdgeInsets.all(1.0),
          decoration: BoxDecoration(
            color: badgeColor,
            shape: BoxShape.circle,
          ),
          constraints: BoxConstraints(
            minWidth: 18.0,
            minHeight: 18.0,
          ),
          child: Center(
            child: Text(
              badgeText,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: 10.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    ],
  );
}
