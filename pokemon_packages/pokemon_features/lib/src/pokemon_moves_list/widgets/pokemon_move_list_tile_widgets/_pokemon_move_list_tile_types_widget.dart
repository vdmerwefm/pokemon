part of '../_barrel_pokemon_move_list.dart';

class PokemonMoveListTileTypesWidget extends StatelessWidget {
  const PokemonMoveListTileTypesWidget({
    required this.pokemonMoveType,
    required this.pokemonMoveDamageClass,
    super.key,
  });

  final String pokemonMoveType;
  final String pokemonMoveDamageClass;

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Row(
        spacing: 8,
        children: [
          PokemonInfoPillWidget(
            text: pokemonMoveType,
            type: pokemonMoveType,
          ),
          PokemonInfoPillWidget(
            text:
                'Damage Class: '
                '$pokemonMoveDamageClass',
          ),
        ],
      ),
    );
  }
}
