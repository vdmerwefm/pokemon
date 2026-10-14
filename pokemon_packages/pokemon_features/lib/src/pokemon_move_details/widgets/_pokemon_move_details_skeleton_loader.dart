part of '_barrel_pokemon_move_details.dart';

class PokemonDetailsSkeletonLoader extends StatelessWidget {
  const PokemonDetailsSkeletonLoader({super.key});

  @override
  Widget build(BuildContext context) {
    final strengthsAndWeaknessesList = [
      'ghost',
      'ghost',
      'ghost',
      'ghost',
      'ghost',
      'ghost',
      'ghost',
    ];

    return Skeletonizer(
      enabled: true,
      effect: const PulseEffect(
        from: Color(0xFF1A1A1A),
        to: Color(0xFF3A3A3A),
        duration: Duration(seconds: 1),
      ),
      textBoneBorderRadius: const TextBoneBorderRadius(
        BorderRadiusGeometry.zero,
      ),
      child: SingleChildScrollView(
        physics: const NeverScrollableScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.only(left: 16, right: 16, top: 16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                color: const Color(0xFF1A1A1A),
                width: MediaQuery.sizeOf(context).width,
                height: 208,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Container(
                      width: 100,
                      height: 208,
                      color: const Color(0xFF3A3A3A),
                    ),
                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.only(bottom: 8, left: 16),
                        child: Column(
                          spacing: 6,
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              spacing: 8,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(4),
                                  child: Container(
                                    height: 36,
                                    width: 36,
                                    color: const Color(0xFF3A3A3A),
                                  ),
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      StringUtils.idValidator(248),
                                      style: pokemonInfoStyle(
                                        const Color(0xFFE5E5E5),
                                        fontSize: 10,
                                      ),
                                    ),
                                    Text(
                                      'Gengar'.toUpperCase(),
                                      style: pokemonInfoStyle(
                                        const Color(0xFFE5E5E5),
                                        fontSize: 14,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            height4,
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              spacing: 8,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                    right: 16,
                                    bottom: 4,
                                  ),
                                  child: Text(
                                    StringUtils.restructurePokemonFlavorText(
                                      'this is gengar placholder, gengar '
                                      'is aweosme and i dont care what anyone '
                                      'else says about gengar',
                                    ),
                                    style: pokemonInfoStyle(
                                      const Color(0xFFE5E5E5),
                                      fontSize: 8,
                                    ),
                                  ),
                                ),
                                const PokemonDividerAltWidget(
                                  height: 2,
                                  padding: 10,
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                SizedBox(
                                  height: 26,
                                  child: Row(
                                    spacing: 8,
                                    children: [
                                      Row(
                                        spacing: 8,
                                        children: ['gh', 'dr'].map(
                                          (type) {
                                            return Container(
                                              height: 16,
                                              width: 40,
                                              color: const Color(0xFF1A1A1A),
                                            );
                                          },
                                        ).toList(),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              height16,
              const PokemonHeaderWidget(
                headerText: 'Ailment, Effect, and Damage Class',
                fontSize: 10,
              ),
              height16,
              PokemonMoveDetailsExpandedTextRowWidget(
                text: 'Ailment:'.toUpperCase(),
                description: 'None',
              ),
              height16,
              PokemonMoveDetailsExpandedTextRowWidget(
                text: 'Effecy:'.toUpperCase(),
                description:
                    'inflicts regular damage with an additional effect',
              ),
              height16,
              PokemonMoveDetailsExpandedTextRowWidget(
                text: 'Damage Class:'.toUpperCase(),
                description: 'physical damage controlled by attack and defense',
              ),
              height24,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                spacing: 4,
                children: [
                  const PokemonInfoTileWidget(
                    infoTitle: 'power:',
                    infoTitleColor: Color(0xFFE93F6E),
                    infoValue: '50 points',
                    infoValueColor: Color(0xFFE5E5E5),
                    infoFlavor: '///damage output',
                    infoFlavorColor: Color(
                      0xFFB0B0B0,
                    ),
                    tileColor: Color(0xFF141414),
                  ),
              
                  PokemonInfoTileWidget(
                    infoTitle: 'accuracy:',
                    infoTitleColor: const Color(0xFFE93F6E),
                    infoValue: '100 points',
                    infoValueColor: const Color(0xFF141414),
                    infoFlavor: '///liklihood of landing',
                    infoFlavorColor: const Color(
                      0xFF141414,
                    ).withValues(alpha: 35),
                    tileColor: const Color(0xFF141414),
                  ),
              
                  const PokemonInfoTileWidget(
                    infoTitle: 'pp:',
                    infoTitleColor: Color(0xFFE93F6E),
                    infoValue: '35 points',
                    infoValueColor: Color(0xFFE5E5E5),
                    infoFlavor: '///pokedex average',
                    infoFlavorColor: Color(
                      0xFFB0B0B0,
                    ),
                    tileColor: Color(0xFF141414),
                  ),
                ],
              ),
              height24,
              const PokemonHeaderWidget(
                headerText: 'Strengths and Weaknesses',
                fontSize: 10,
              ),
              height16,
              Column(
                children: [
                  Row(
                    spacing: 8,
                    children: [
                      Container(
                        height: 28,
                        width: 104,
                        color: const Color(0xFF1A1A1A),
                      ),
                      Row(
                        spacing: 8,
                        children: strengthsAndWeaknessesList.map((type) {
                          return Image.asset(
                            fit: BoxFit.contain,
                            PokemonGetTypeUtil.getTypeBadges(type),
                            package: 'pokemon_ui_kit',
                            height: 24,
                            width: 24,
                          );
                        }).toList(),
                      ),
                    ],
                  ),
                ],
              ),
              height16,
              const PokemonHeaderWidget(
                headerText: 'Pokemon list:',
                fontSize: 10,
              ),
              height16,
              ListView.builder(
               shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: 7,
                itemBuilder: (context, index) {
                  return const PokemonSkeletonListTileWidget(
                    skeletonList: ['gh','dr'],
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
