part of '../_barrel_pokemon_move_list.dart';

class PokemonMoveSkeletonListTileWidget extends StatelessWidget {
  const PokemonMoveSkeletonListTileWidget({
    required this.skeletonListType,
    super.key,
  });

  final String skeletonListType;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFF1A1A1A),
      height: 96,
      width: MediaQuery.sizeOf(context).width,
      child: Row(
        children: [
          Container(
            color: const Color(0xFF3A3A3A),
            height: 100,
            width: 100,
          ),
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
                    Row(
                      spacing: 8,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(
                            4,
                          ),
                          child: Container(
                            height: 36,
                            width: 36,
                            color: const Color(0xFFE5E5E5),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                            top: 10,
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,

                            children: [
                              Text(
                                StringUtils.idValidator(
                                  0,
                                ).toUpperCase(),
                                style: pokemonInfoStyle(
                                  const Color(0xFFE5E5E5),
                                  fontSize: 10,
                                ),
                              ),
                              Text(
                                'vine-whip',
                                style: pokemonInfoStyle(
                                  const Color(0xFFE5E5E5),
                                  fontSize: 14,
                                ),
                              ),
                              height6,
                            ],
                          ),
                        ),
                      ],
                    ),
                    height4,
                    const PokemonDividerAltWidget(
                      padding: 12,
                    ),
                    height4,
                    Flexible(
                      child: Row(
                        spacing: 8,
                        children: [
                          Text(
                            skeletonListType,
                            style: pokemonInfoStyle(
                              const Color(0xFFE5E5E5),
                              fontSize: 18,
                            ),
                          ),
                          Text(
                            'Damage Class: ',
                            style: pokemonInfoStyle(
                              const Color(0xFFE5E5E5),
                              fontSize: 18,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
