part of '../_barrel_pokemon_move_details.dart';

class PokemonMoveDetailsCardFlavorTextWidget extends StatelessWidget {
  const PokemonMoveDetailsCardFlavorTextWidget({
    required this.pokemonMoveFlavorText,
    super.key,
  });
  final String pokemonMoveFlavorText;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 8,
      children: [
        Padding(
          padding: const EdgeInsets.only(
            right: 8,
          ),
          child: Text(
            StringUtils.restructurePokemonFlavorText(
              pokemonMoveFlavorText,
            ),
            style: pokemonInfoStyle(
              const Color(0xFFE5E5E5),
              fontSize: 8,
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
