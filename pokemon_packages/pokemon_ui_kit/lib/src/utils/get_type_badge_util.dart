import 'package:flutter/material.dart';
import 'package:pokemon_models/pokemon_models.dart';

class GetTypeBadgeUtil {
  static Color getColor(String types) {
    final type = PokemonType.values.asNameMap()[types];
    return switch (type) {
      PokemonType.bug => const Color(0xFFC2D501),
      PokemonType.dark => const Color(0xFF3A3A3A),
      PokemonType.dragon => const Color(0xFF406CA9),
      PokemonType.electric => const Color(0xFFFCDC00),
      PokemonType.fairy => const Color(0xFFF3B1DB),
      PokemonType.fighting => const Color(0xFFFCB600),
      PokemonType.fire => const Color(0xFFFC671A),
      PokemonType.flying => const Color(0xFF93D5E8),
      PokemonType.ghost => const Color(0xFF805474),
      PokemonType.grass => const Color(0xFF35D32F),
      PokemonType.ground => const Color(0xFFC6883D),
      PokemonType.ice => const Color(0xFF1DC1DD),
      PokemonType.normal => const Color(0xFFC3BEB5),
      PokemonType.poison => const Color(0xFFB04EC4),
      PokemonType.psychic => const Color(0xFFF16177),
      PokemonType.rock => const Color(0xFFCBC594),
      PokemonType.steel => const Color(0xFF72C3D5),
      PokemonType.water => const Color(0xFF0083C2),
      _ => const Color(0xFFE93F6E),
    };
  }

  static String getTypeBadges(String typeFromData) {
    String? badge;
    for (final type in PokemonType.values) {
      if (type.name == typeFromData) {
        badge = type.imagePath;
      }
    }

    return badge ?? '';
  }
}
