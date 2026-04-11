import 'package:flutter/material.dart';
import 'package:pokemon_features/pokemon_features.dart';

class Header extends StatelessWidget {
  const Header({
    required this.headerText,
    super.key,
  });

  final String headerText;

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 8,
      children: [
        const PokemonDivider(),
        Padding(
          padding: const EdgeInsets.all(8),
          child: Text(
            headerText.toUpperCase(),
            style: pokemonInfoStyle(
              const Color(0xFFE5E5E5),
              fontSize: 10,
            ),
          ),
        ),
        const PokemonDivider(),
      ],
    );
  }
}
