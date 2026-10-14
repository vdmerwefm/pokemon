part of '../_barrel_pokemon_move_list.dart';

class PokemonMoveTileWidget extends StatelessWidget {
  const PokemonMoveTileWidget({
    required this.pokemonMoveName,
    required this.pokemonMoveType,
    required this.pokemonMoveId,
    required this.pokemonMoveDamageClass,
    super.key,
  });

  final String? pokemonMoveName;
  final String? pokemonMoveType;
  final int? pokemonMoveId;
  final String? pokemonMoveDamageClass;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.read<PokemonAudioBloc>().add(
          const PokemonAudioEvents.onPlaySelectBite(),
        );

        context.router.popAndPush(
          PokemonMoveDetailsRoute(
            name: pokemonMoveName ?? '',
            type: pokemonMoveType ?? '',
          ),
        );
      },
      child: Container(
        padding: const EdgeInsets.only(top: 16),
        height: 112,
        width: MediaQuery.sizeOf(context).width,
        child: Row(
          children: [
            PokemonMoveListTileImageWidget(pokemonMoveType: pokemonMoveType ?? ''),
            Expanded(
              child: ColoredBox(
                color: const Color(0xFF1A1A1A),
                child: Padding(
                  padding: const EdgeInsets.only(
                    left: 12,
                    bottom: 8,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      height8,
                      PokemonMoveListTileInfoWidget(
                        pokemonMoveName: pokemonMoveName ?? '',
                        pokemonMoveType: pokemonMoveType ?? '',
                        pokemonMoveId: pokemonMoveId ?? 0,
                      ),
                      height4,
                      const PokemonDividerAltWidget(
                        padding: 12,
                      ),
                      height8,
                      PokemonMoveListTileTypesWidget(
                        pokemonMoveType: pokemonMoveType ?? '',
                        pokemonMoveDamageClass: pokemonMoveDamageClass ?? '',
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
