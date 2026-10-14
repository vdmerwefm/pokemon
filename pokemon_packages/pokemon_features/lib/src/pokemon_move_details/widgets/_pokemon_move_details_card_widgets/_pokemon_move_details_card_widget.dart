part of '../_barrel_pokemon_move_details.dart';

class PokemonMoveDetailsCardWidget extends StatelessWidget {
  const PokemonMoveDetailsCardWidget({
    required this.pokemonMoveDetailsData,
    super.key,
  });

  final PokemonMoveDetailsModel pokemonMoveDetailsData;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFF1A1A1A),
      width: MediaQuery.sizeOf(context).width,
      height: 208,
      child: Row(
        children: [
          PokemonMoveDetailsCardImage(
            type: pokemonMoveDetailsData.type ?? '',
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.only(
                bottom: 8,
                left: 16,
              ),
              child: Column(
                spacing: 2,
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  PokemonMoveDetailsCardInfoWidget(
                    pokemonMoveId: pokemonMoveDetailsData.id ?? 0,
                    pokemonMoveName: pokemonMoveDetailsData.name ?? '',
                    pokemonMoveType: pokemonMoveDetailsData.type ?? '',
                  ),
                  height8,
                  PokemonMoveDetailsCardFlavorTextWidget(
                    pokemonMoveFlavorText:
                        pokemonMoveDetailsData.moveFlavorText ?? '',
                  ),
                  height4,
                  PokemonMoveDetailsCardChipsWidget(
                    pokemonMoveType: pokemonMoveDetailsData.type ?? '',
                    pokemonMoveDamageClass:
                        pokemonMoveDetailsData.damageClass ?? '',
                    pokemonMoveMachine: pokemonMoveDetailsData.machines ?? '',
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
