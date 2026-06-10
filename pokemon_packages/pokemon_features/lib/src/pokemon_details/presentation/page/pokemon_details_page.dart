part of '../../widgets/_barrel_pokemon_details.dart';

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
    return PokemonScaffold(
      body: BlocProvider(
        create: (context) => sl<PokemonDetailsBloc>()
          ..add(PokemonDetailsEvents.onGetPokemonDetails(name: pokemonName))
          ..add(
            PokemonDetailsEvents.onGetPokemonDamageIndecies(
              types: pokemonTypes,
            ),
          ),
        child: BlocBuilder<PokemonDetailsBloc, PokemonDetailsState>(
          builder: (context, state) {
            final pokemon = state.pokemonDetails;
            final loadingEmptyOrFailure =
                state.isLoading || pokemon == null || state.failure != null;

            if (loadingEmptyOrFailure) {
              return const PokemonDetailsSkeletonLoader();
            }

            return Padding(
              padding: const EdgeInsets.only(
                left: 16,
                right: 16,
                top: 16,
                bottom: 24,
              ),
              child: CustomScrollView(
                clipBehavior: Clip.none,
                slivers: [
                  SliverToBoxAdapter(
                    child: PokemonDetailsCardWidget(
                      pokemonSprite: pokemon.sprite ?? '',
                      pokemonTypes: pokemon.type ?? [],
                      pokemonId: pokemon.id ?? 0,
                      pokemonName: pokemon.name ?? '',
                      pokemonFlavorText: pokemon.flavorText ?? '',
                      pokemonGenus: pokemon.genus ?? '',
                    ),
                  ),
                  sliverHeight12,
                  if (pokemon.cry!.isNotEmpty)
                    SliverToBoxAdapter(
                      child: PokemonCryWidget(
                        pokemonName: pokemon.name ?? '',
                        pokemonCry: pokemon.cry ?? '',
                      ),
                    ),
                  sliverHeight16,
                  SliverToBoxAdapter(
                    child: Row(
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

                        if (pokemon.ability!.isNotEmpty)
                          PokemonInfoTileWidget(
                            abilities: pokemon.ability ?? [],
                            infoTitle: 'ability:',
                            infoTitleColor: const Color(0xFFE93F6E),
                            infoValue: '',
                            infoValueColor: const Color(0xFF141414),
                            infoFlavor: '///standard (non-hidden)',
                            infoFlavorColor: const Color(
                              0xFF141414,
                            ).withValues(alpha: 35),
                            tileColor: const Color(0xFFE5E5E5),
                          )
                        else
                          const SizedBox.shrink(),

                        PokemonInfoTileWidget(
                          infoTitle: 'weight:',
                          infoTitleColor: const Color(0xFFE93F6E),
                          infoValue: StringUtils.convertPokemonWeight(
                            pokemon.weight ?? 0,
                          ),
                          infoValueColor: pokemon.ability!.isNotEmpty
                              ? const Color(0xFFE5E5E5)
                              : const Color(0xFF141414),
                          infoFlavor: '///pokedex average',
                          infoFlavorColor: pokemon.ability!.isNotEmpty
                              ? const Color(
                                  0xFFB0B0B0,
                                )
                              : const Color(
                                  0xFF141414,
                                ).withValues(alpha: 35),
                          tileColor: pokemon.ability!.isNotEmpty
                              ? const Color(0xFF141414)
                              : const Color(0xFFE5E5E5),
                        ),
                      ],
                    ),
                  ),
                  sliverHeight16,
                  SliverToBoxAdapter(
                    key: const ValueKey('damageIndexKey'),
                    child: StrengthsAndWeaknessesWidget(
                      strongAgainst: state.strongAgainst,
                      weakAgainst: state.weakAgainst,
                    ),
                  ),
                  sliverHeight16,
                  SliverToBoxAdapter(
                    child: PokemonEvolutionChainWidget(
                      chainHeader: 'Evolution Chain',
                      activePokemonName: pokemon.name ?? '',
                      pokemonEvolutionChain:
                          state.pokemonDetails?.evolutions ?? [],
                    ),
                  ),
                  sliverHeight16,
                  if (pokemon.forms!.isNotEmpty)
                    SliverToBoxAdapter(
                      child: PokemonEvolutionChainWidget(
                        chainHeader: 'Forms and Transformations',
                        activePokemonName: pokemon.name ?? '',
                        pokemonEvolutionChain:
                            state.pokemonDetails?.forms ?? [],
                      ),
                    ),
                  sliverHeight16,
                  if (pokemon.levelUpMoves!.isNotEmpty)
                    PokemonMovesWidget(
                      moveCount: pokemon.levelUpMoves?.length,
                      movesData: pokemon.levelUpMoves,
                    ),
                  //if (pokemon.levelUpMoves!.isNotEmpty) sliverHeight16,
                  SliverToBoxAdapter(
                    child: PokemonStatsListWidget(
                      pokemonStats: pokemon.stats ?? [],
                    ),
                  ),
                  sliverHeight16,
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
