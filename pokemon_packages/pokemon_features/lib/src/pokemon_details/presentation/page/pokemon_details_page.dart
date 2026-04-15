import 'package:pokemon_features/src/pokemon_details/widgets/_barrel_pokemon_details.dart';

@RoutePage()
class PokemonDetailsPage extends StatelessWidget {
  const PokemonDetailsPage({
    required this.pokemonName,
    required this.pokemonTypes,
    super.key,
  });

  final String pokemonName;
  final List<String> pokemonTypes;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<PokemonDetailsBloc>()
        ..add(PokemonDetailsEvents.onGetPokemonDetails(name: pokemonName))
        ..add(
          PokemonDetailsEvents.onGetPokemonDamageIndecies(
            types: pokemonTypes,
          ),
        ),
      child: BlocBuilder<PokemonDetailsBloc, PokemonDetailsState>(
        builder: (context, state) {
          if (state.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          if (state.failure != null) {
            return Center(child: Text(state.failure!.message));
          }

          final pokemon = state.pokemonDetails;

          if (pokemon == null) {
            return const SizedBox.shrink();
          }

          return SingleChildScrollView(
            padding: const EdgeInsets.only(bottom: 24),
            child: Padding(
              padding: const EdgeInsets.only(left: 16, right: 16, top: 16),
              child: Column(
                spacing: 16,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  PokemonDetailsCardWidget(
                    pokemonSprite: pokemon.sprite ?? '',
                    pokemonTypes: pokemon.type ?? [],
                    pokemonId: pokemon.id ?? 0,
                    pokemonName: pokemon.name ?? '',
                    pokemonFlavorText: pokemon.flavorText ?? '',
                    pokemonGenus: pokemon.genus ?? '',
                  ),

                  const PokemonDividerWidget(),

                  PokemonCryWidget(
                    pokemonName: pokemon.name ?? '',
                    pokemonCry: pokemon.cry ?? '',
                  ),

                  const PokemonDividerWidget(),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    spacing: 4,
                    children: [
                      PokemonInfoTileWidget(
                        infoTitle: 'height:',
                        infoTitleColor: const Color(0xFFE93F6E),
                        infoValue: StringUtils.convertPokemonHeight(
                          pokemon.height ?? 0,
                        ),
                        infoValueColor: const Color(0xFFE5E5E5),
                        infoFlavor: '///pokedex average',
                        infoFlavorColor: const Color(
                          0xFFB0B0B0,
                        ),
                        tileColor: const Color(0xFF141414),
                      ),

                      PokemonInfoTileWidget(
                        abilities: pokemon.ability ?? [],
                        infoTitle: 'ability:',
                        infoTitleColor: const Color(0xFFE93F6E),
                        infoValue: pokemon.ability?.first ?? '',
                        infoValueColor: const Color(0xFF141414),
                        infoFlavor: '///standard (non-hidden)',
                        infoFlavorColor: const Color(
                          0xFF141414,
                        ).withValues(alpha: 35),
                        tileColor: const Color(0xFFE5E5E5),
                      ),

                      PokemonInfoTileWidget(
                        infoTitle: 'weight:',
                        infoTitleColor: const Color(0xFFE93F6E),
                        infoValue: StringUtils.convertPokemonWeight(
                          pokemon.weight ?? 0,
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
                      StrongAgainstWidget(
                        strongAgainst: state.strongAgainst ?? [],
                      ),

                      WeakAgainstWidget(weakAgainst: state.weakAgainst ?? []),
                    ],
                  ),

                  const HeaderWidget(headerText: 'Evolution Chain'),

                  PokemonEvolutionChainWidget(
                    pokemonEvolutionChain:
                        state.pokemonDetails?.evolutions ?? [],
                  ),

                  const HeaderWidget(headerText: 'Pokemon Moves'),

                  GridView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                          mainAxisSpacing: 6,
                          crossAxisSpacing: 24,
                          crossAxisCount: 2,
                          childAspectRatio: 3,
                        ),
                    itemCount: state.pokemonDetails?.levelUpMoves?.length,
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
                                  state
                                          .pokemonDetails
                                          ?.levelUpMoves?[index]
                                          .pokemonMoveType ??
                                      '',
                                ),
                                package: 'pokemon_ui_kit',
                                height: 48,
                                width: 48,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top:16),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  
                                  children: [
                                    Text(
                                      (state
                                                  .pokemonDetails
                                                  ?.levelUpMoves?[index]
                                                  .pokemonMoveType ??
                                              '')
                                          .toUpperCase(),
                                      style: pokemonInfoStyle(
                                        const Color(0xFFE5E5E5),
                                        fontSize: 8,
                                      ),
                                    ),
                                    Text(
                                      (state
                                                  .pokemonDetails
                                                  ?.levelUpMoves?[index]
                                                  .pokemonMoveName ??
                                              '')
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
                  const HeaderWidget(headerText: 'Pokemon Stats'),

                  PokemonStatsListWidget(pokemonStats: pokemon.stats ?? []),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
