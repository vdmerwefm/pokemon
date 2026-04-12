import 'package:flutter/material.dart';

class StatRectanglePainterUtil {
  static Color getStatColor(double stat) {
    if (stat <= 60) {
      return const Color(0xFFE93F6E);
    } else if (stat > 60 && stat <= 90) {
      return const Color(0xFFFCB600);
    } else if (stat > 90 && stat <= 120) {
      return const Color(0xFF35D32F);
    } else {
      return const Color(0xFF0083C2);
    }
  }
}
