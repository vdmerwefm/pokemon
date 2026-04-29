part of '_barrel_pokemon_details.dart';

class PokemonMovesWidget extends StatelessWidget {
  const PokemonMovesWidget({
    required this.moveCount,
    required this.movesData,
    super.key,
  });

  final int? moveCount;
  final List<PokemonMovesModel>? movesData;

  @override
  Widget build(BuildContext context) {
    return SliverMainAxisGroup(
      slivers: [
        const SliverToBoxAdapter(
          child: HeaderWidget(headerText: 'Pokemon Moves'),
        ),
        sliverHeight16,
        SliverGrid.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            mainAxisSpacing: 16,
            crossAxisSpacing: 16,
            crossAxisCount: 2,
            childAspectRatio: 3,
          ),
          itemCount: moveCount,
          itemBuilder: (context, index) => Column(
            children: [
              ColoredBox(
                color: const Color(0xFF1A1A1A),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ColoredBox(
                      color: const Color(0xFF3A3A3A),
                      child: Transform.scale(
                        alignment: AlignmentDirectional.center,
                        scale: 1.6,
                        child: Image.asset(
                          scale: 4,
                          fit: BoxFit.cover,
                          GetTypeBadgeUtil.getMoveImage(
                            movesData?[index].pokemonMoveType ?? '',
                          ),
                          package: 'pokemon_ui_kit',
                          width: 60,
                          height: 52,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 8, top: 6),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            (movesData?[index].pokemonMoveType ?? '')
                                .toUpperCase(),
                            style: pokemonInfoStyle(
                              const Color(0xFFE5E5E5),
                              fontSize: 8,
                            ),
                          ),
                          Text(
                            (movesData?[index].pokemonMoveName ?? '')
                                .toUpperCase(),
                            style: pokemonInfoStyle(
                              const Color(0xFFE5E5E5),
                              fontSize: 10,
                            ),
                          ),
                          Text(
                            'lvl ${movesData?[index].pokemonMoveLevel ?? 0}'
                                .toUpperCase(),
                            style: pokemonInfoStyle(
                              const Color(0xFFE5E5E5),
                              fontSize: 10,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        sliverHeight16,
      ],
    );
  }
}
