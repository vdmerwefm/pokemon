import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

class PokemonLeadingWidget extends StatelessWidget {
  const PokemonLeadingWidget({this.isFavorite, super.key});

  final bool? isFavorite;

  @override
  Widget build(BuildContext context) {
    if (context.router.current.name == 'PokemonMainRoute') {
      return leadingWidgetHelper(
        icon: Icons.favorite_rounded,
        size: 28,
        text: '42',
      );
    } else {
      if (isFavorite != null) {
        return leadingWidgetHelper(
          icon: Icons.add_circle_rounded,
          size: 28,
          text: 'ADD TO FAVORITES',
        );
      } else {
        return leadingWidgetHelper(
          icon: Icons.remove_circle_rounded,
          size: 28,
          text: 'REMOVE FROM FAVORITES',
        );
      }
    }
  }

  Widget leadingWidgetHelper({
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
