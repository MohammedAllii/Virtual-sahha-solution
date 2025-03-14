import 'dart:ui';

import 'package:flutter/material.dart';

class LozengeClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path()
      ..moveTo(size.width / 2, 0) // 
      ..lineTo(size.width, size.height / 2) 
      ..lineTo(size.width / 2, size.height) 
      ..lineTo(0, size.height / 2) 
      ..close(); 
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false; 
  }
}
