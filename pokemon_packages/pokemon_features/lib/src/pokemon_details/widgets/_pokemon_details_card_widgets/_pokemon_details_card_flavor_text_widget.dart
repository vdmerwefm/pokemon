part of '../_barrel_pokemon_details.dart';

class PokemonDetailsCardFalvorTextWidget extends StatelessWidget {
  const PokemonDetailsCardFalvorTextWidget({
    required this.pokemonFlavorText,
    super.key,
  });

  final String? pokemonFlavorText;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 8,
      children: [
        Padding(
          padding: const EdgeInsets.only(right: 8),
          child: Text(
            StringUtils.restructurePokemonFlavorText(
              pokemonFlavorText ?? '',
            ),
            style: pokemonInfoStyle(
              const Color(0xFFE5E5E5),
              fontSize: 6,
            ),
          ),
        ),
    
        const PokemonDividerAltWidget(
          height: 8,
          padding: 8,
        ),
      ],
    );
  }
}
