part of '../_barrel_pokemon_move_details.dart';

class PokemonMoveDetailsCardChipsWidget extends StatelessWidget {
  const PokemonMoveDetailsCardChipsWidget({
    required this.pokemonMoveType,
    required this.pokemonMoveDamageClass,
    required this.pokemonMoveMachine,
    super.key,
  });

  final String pokemonMoveType;
  final String pokemonMoveDamageClass;
  final String pokemonMoveMachine;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 2),
      child: Row(
        spacing: 8,
        children: [
          PokemonInfoPill(
            text: pokemonMoveType,
            type: pokemonMoveType
          ),
          PokemonInfoPill(
            text: pokemonMoveDamageClass,
          ),
          if (pokemonMoveMachine.isNotEmpty) ...[
            const PokemonInfoPill(
              text: 'Machine',
            ),
          ],
        ],
      ),
    );
  }
}
