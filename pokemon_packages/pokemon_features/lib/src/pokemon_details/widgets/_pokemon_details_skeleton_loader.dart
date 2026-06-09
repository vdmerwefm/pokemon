part of '_barrel_pokemon_details.dart';

class PokemonDetailsSkeletonLoader extends StatelessWidget {
  const PokemonDetailsSkeletonLoader({super.key});

  @override
  Widget build(BuildContext context) {
    final skeletonList = ['Item1', 'Item2'];
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
            spacing: 16,
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
                      width: 124,
                      height: 208,
                      color: const Color(0xFF3A3A3A),
                    ),
                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.only(bottom: 8, left: 24),
                        child: Column(
                          spacing: 8,
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
                                      fontSize: 6,
                                    ),
                                  ),
                                ),

                                const PokemonDividerAltWidget(
                                  height: 0,
                                  padding: 10,
                                ),
                              ],
                            ),

                            Column(
                              children: [
                                SizedBox(
                                  height: 24,
                                  child: Row(
                                    spacing: 8,
                                    children: [
                                      Container(
                                        height: 16,
                                        width: 48,
                                        color: const Color(0xFF1A1A1A),
                                      ),
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

              const PokemonDividerWidget(),

              const PokemonCryWidget(
                pokemonName: 'Gengar',
                pokemonCry: '',
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                spacing: 4,
                children: [
                  PokemonInfoTileWidget(
                    infoTitle: 'height:',
                    infoTitleColor: const Color(0xFFE93F6E),
                    infoValue: StringUtils.convertPokemonHeight(
                      0,
                    ),
                    infoValueColor: const Color(0xFFE5E5E5),
                    infoFlavor: '///pokedex average',
                    infoFlavorColor: const Color(
                      0xFFB0B0B0,
                    ),
                    tileColor: const Color(0xFF141414),
                  ),

                  PokemonInfoTileWidget(
                    abilities: const ['ability awesome', 'ability pokemon'],
                    infoTitle: 'ability:',
                    infoTitleColor: const Color(0xFFE93F6E),
                    infoValue: '',
                    infoValueColor: const Color(0xFF141414),
                    infoFlavor: '///standard (non-hidden)',
                    infoFlavorColor: const Color(
                      0xFF141414,
                    ).withValues(alpha: 35),
                    tileColor: const Color(0xFF141414),
                  ),

                  PokemonInfoTileWidget(
                    infoTitle: 'weight:',
                    infoTitleColor: const Color(0xFFE93F6E),
                    infoValue: StringUtils.convertPokemonWeight(
                      0,
                    ),
                    infoValueColor: const Color(0xFFE5E5E5),
                    infoFlavor: '///pokedex average',
                    infoFlavorColor: const Color(
                      0xFFB0B0B0,
                    ),
                    tileColor: const Color(0xFF141414),
                  ),
                ],
              ),

              const HeaderWidget(
                headerText: 'Strengths and Weaknesses',
              ),

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
                            GetTypeUtil.getTypeBadges(type),
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

              const HeaderWidget(headerText: 'Evolution Chain'),

              Padding(
                padding: const EdgeInsets.only(left: 16, right: 16),
                child: ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: 7,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(top: 16),
                      child: Container(
                        color: const Color(0xFF1A1A1A),
                        width: MediaQuery.sizeOf(context).width,
                        height: 96,
                        child: Row(
                          children: [
                            Container(
                              height: 96,
                              width: 100,
                              color: const Color(0xFF3A3A3A),
                            ),
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.only(
                                  left: 12,
                                  top: 8,
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Venusaur',
                                      style: pokemonInfoStyle(
                                        const Color(0xFFE5E5E5),
                                      ),
                                    ),
                                    Text(
                                      '#003',
                                      style: pokemonInfoStyle(
                                        const Color(0xFFE5E5E5),
                                        fontSize: 16,
                                      ),
                                    ),
                                    Text(
                                      'Seed Pokemon',
                                      style: pokemonInfoStyle(
                                        const Color(0xFFE5E5E5),
                                        fontSize: 10,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        spacing: 8,
                                        children: [
                                          Column(
                                            spacing: 8,
                                            mainAxisSize: MainAxisSize.min,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.end,
                                            children: skeletonList.map((type) {
                                              return Container(
                                                padding: const EdgeInsets.only(
                                                  top: 1,
                                                ),
                                                height: 24,
                                                child: Center(
                                                  child: Text(
                                                    type.toUpperCase(),
                                                    style:
                                                        pokemonBadgeTextStyle(
                                                          const Color(
                                                            0xFFE5E5E5,
                                                          ),
                                                        ),
                                                  ),
                                                ),
                                              );
                                            }).toList(),
                                          ),
                                          Column(
                                            spacing: 8,
                                            mainAxisSize: MainAxisSize.min,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.end,
                                            children: skeletonList.map((type) {
                                              return ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(4),
                                                child: Container(
                                                  color: const Color(
                                                    0xFF3A3A3A,
                                                  ),
                                                  height: 24,
                                                  width: 24,
                                                ),
                                              );
                                            }).toList(),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),

              const HeaderWidget(headerText: 'Pokemon Moves'),
            ],
          ),
        ),
      ),
    );
  }
}
