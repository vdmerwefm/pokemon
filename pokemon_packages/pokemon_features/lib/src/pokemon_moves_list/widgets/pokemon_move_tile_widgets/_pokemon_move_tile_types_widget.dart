part of '../_barrel_pokemon_move_list.dart';

class PokemonMoveTileTypesWidget extends StatelessWidget {
  const PokemonMoveTileTypesWidget({
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
          PokemonInfoPill(
            text: pokemonMoveType,
            type: pokemonMoveType,
          ),
          PokemonInfoPill(
            text:
                'Damage Class: '
                '$pokemonMoveDamageClass',
          ),
        ],
      ),
    );
  }
}
