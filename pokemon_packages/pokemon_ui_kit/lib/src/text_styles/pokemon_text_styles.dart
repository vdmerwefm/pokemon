import 'package:flutter/material.dart';

TextStyle pokemonInfoStyle(Color color, {double? fontSize}) {
  return TextStyle(
    color: color,
    fontSize: fontSize ?? 18,
    fontFamily: 'pokemon_font',
    fontWeight: FontWeight.w900,
    package: 'pokemon_ui_kit',
  );
}

TextStyle pokemonBadgeTextStyle(Color color) {
  return TextStyle(
    color: color,
    fontSize: 10,
    fontFamily: 'pokemon_font',
    fontWeight: FontWeight.w900,
    package: 'pokemon_ui_kit',
  );
}