import 'package:flutter/material.dart';

class SeatClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    double h = size.height;
    double w = size.width;
    Path path = Path()
      ..moveTo(0, h)
      ..lineTo(0, 0)
      ..lineTo(w, 0)
      ..lineTo(w, h)
      ..lineTo(w - 10, h)
      ..lineTo(w - 10, 10)
      ..lineTo(10, 10)
      ..lineTo(10, h)
      ..close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}

class DisplayClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    double h = size.height;
    double w = size.width;
    Path path = Path()
      ..moveTo(0, h)
      ..lineTo(0, 0)
      ..lineTo(w, 0)
      ..lineTo(w, h)
      ..lineTo(w - 5, h)
      ..lineTo(w - 5, 5)
      ..lineTo(5, 5)
      ..lineTo(5, h)
      ..close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
