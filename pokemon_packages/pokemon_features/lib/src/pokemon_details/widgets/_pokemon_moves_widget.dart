import 'package:pokemon_features/src/pokemon_details/widgets/_barrel_pokemon_details.dart';

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
    return Column(
      children: [
        const HeaderWidget(headerText: 'Pokemon Moves'),
        height16,
        GridView.builder(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            mainAxisSpacing: 6,
            crossAxisSpacing: 24,
            crossAxisCount: 2,
            childAspectRatio: 3,
          ),
          itemCount: moveCount,
          itemBuilder: (context, index) => Column(
            spacing: 8,
            children: [
              ColoredBox(
                color: const Color(0xFF1A1A1A),
                child: Row(
                  spacing: 8,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Image.asset(
                      alignment: Alignment.bottomRight,
                      fit: BoxFit.cover,
                      GetTypeBadgeUtil.getTypeBadges(
                        movesData?[index].pokemonMoveType ?? '',
                      ),
                      package: 'pokemon_ui_kit',
                      height: 48,
                      width: 48,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 16),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
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
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
