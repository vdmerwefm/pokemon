import 'dart:io';

import 'package:flutter/material.dart';

class LeadingWidgetHelper {
  static Widget leadingWidgetHelper({
    required IconData icon,
    required double size,
    required String text,
  }) {
    return Padding(
      padding: const EdgeInsets.only(left: 14),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(
            icon,
            color: const Color(0xFFE5E5E5),
            size: size,
          ),
          const SizedBox(
            width: 4,
          ),
          Padding(
            padding: Platform.isAndroid
                ? const EdgeInsets.only(top: 6)
                : EdgeInsets.zero,
            child: Text(
              text,
              style: const TextStyle(
                color: Color(0xFFE5E5E5),
                fontFamily: 'pokemon_font',
                fontWeight: FontWeight.w900,
                package: 'pokemon_ui_kit',
              ),
            ),
          ),
        ],
      ),
    );
  }
}
