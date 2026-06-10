import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

class PokemonLeadingWidget extends StatelessWidget {
  const PokemonLeadingWidget({this.isFavorite, super.key});

  final bool? isFavorite;

  @override
  Widget build(BuildContext context) {
    if (context.router.current.path != '/pokemon-details-route') {
      return favoritesIconHelper(
        icon: const Icon(
          Icons.favorite_rounded,
          color: Color(0xFFE5E5E5),
          size: 28,
        ),
        text: const Text(
          '42',
          style: TextStyle(
            color: Color(0xFFE5E5E5),
            fontFamily: 'pokemon_font',
            fontWeight: FontWeight.w900,
            package: 'pokemon_ui_kit',
          ),
        ),
      );
    } else {
      if (isFavorite != null) {
        return favoritesIconHelper(
          icon: const Icon(
            Icons.add_circle_rounded,
            color: Color(0xFFE5E5E5),
            size: 28,
          ),
          text: const Text(
            'ADD TO FAVORITES',
            style: TextStyle(
              color: Color(0xFFE5E5E5),
              fontFamily: 'pokemon_font',
              fontWeight: FontWeight.w900,
              package: 'pokemon_ui_kit',
            ),
          ),
        );
      } else {
        return favoritesIconHelper(
          icon: const Icon(
            Icons.remove_circle_rounded,
            color: Color(0xFFE5E5E5),
            size: 28,
          ),
          text: const Text(
            'REMOVE FROM FAVORITES',
            style: TextStyle(
              color: Color(0xFFE5E5E5),
              fontFamily: 'pokemon_font',
              fontWeight: FontWeight.w900,
              package: 'pokemon_ui_kit',
            ),
          ),
        );
      }
    }
  }

  Widget favoritesIconHelper({required Widget icon, required Widget text}) {
    return Padding(
      padding: const EdgeInsets.only(left: 14),
      child: Center(
        child: Row(
          children: [
            icon,
            const SizedBox(
              width: 4,
            ),
            text,
          ],
        ),
      ),
    );
  }
}
