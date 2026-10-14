part of '../../widgets/_barrel_pokemon_move_details.dart';

@RoutePage()
class PokemonMoveDetailsPage extends StatelessWidget {
  const PokemonMoveDetailsPage({
    required this.name,
    required this.type,
    super.key,
  });

  final String name;
  final String type;

  @override
  Widget build(BuildContext context) {
    return PokemonScaffoldWidget(
      body: BlocProvider(
        create: (context) => sl<PokemonMoveDetailsBloc>()
          ..add(PokemonMoveDetailsEvents.onGetPokemonMoveDetails(name: name))
          ..add(
            PokemonMoveDetailsEvents.onGetMoveDamageIndecies(types: [type]),
          ),
        child: BlocBuilder<PokemonMoveDetailsBloc, PokemonMoveDetailsState>(
          builder: (context, state) {
            final pokemonMoveDetailsData = state.pokemonMoveDetails;
            if (pokemonMoveDetailsData == null) {
              return const PokemonDetailsSkeletonLoader();
            }
            return Padding(
              padding: const EdgeInsets.all(16),
              child: CustomScrollView(
                clipBehavior: Clip.none,
                slivers: [
                  SliverToBoxAdapter(
                    child: PokemonMoveDetailsCardWidget(
                      pokemonMoveDetailsData: pokemonMoveDetailsData,
                    ),
                  ),
                  sliverHeight16,
                  const SliverToBoxAdapter(
                    child: PokemonHeaderWidget(
                      headerText: 'Ailment, Effect, and Damage Class',
                      fontSize: 10,
                    ),
                  ),
                  sliverHeight16,
                  SliverToBoxAdapter(
                    child: PokemonMoveDetailsExpandedTextRowWidget(
                      text: 'Ailment:'.toUpperCase(),
                      description:
                          pokemonMoveDetailsData.ailment?.toUpperCase() ?? '',
                    ),
                  ),
                  sliverHeight16,
                  SliverToBoxAdapter(
                    child: PokemonMoveDetailsExpandedTextRowWidget(
                      text: 'Effect:'.toUpperCase(),
                      description:
                          pokemonMoveDetailsData.effect
                              ?.toUpperCase()
                              .substring(
                                0,
                                pokemonMoveDetailsData.effect!.length - 1,
                              )
                              .trim() ??
                          '',
                    ),
                  ),
                  sliverHeight16,
                  SliverToBoxAdapter(
                    child: PokemonMoveDetailsExpandedTextRowWidget(
                      text: 'Damage Class:'.toUpperCase(),
                      description:
                          pokemonMoveDetailsData.damageClassDescription
                              ?.toUpperCase() ??
                          '',
                    ),
                  ),
                  sliverHeight16,
                  const SliverToBoxAdapter(child: PokemonDividerWidget()),
                  sliverHeight16,
                  SliverToBoxAdapter(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      spacing: 4,
                      children: [
                        PokemonInfoTileWidget(
                          infoTitle: 'Power:',
                          infoTitleColor: const Color(0xFFE93F6E),
                          infoValue: '${pokemonMoveDetailsData.power} points',
                          infoValueColor: const Color(0xFFE5E5E5),
                          infoFlavor: '///damage output',
                          infoFlavorColor: const Color(
                            0xFFB0B0B0,
                          ),
                          tileColor: const Color(0xFF141414),
                        ),
                        PokemonInfoTileWidget(
                          infoTitle: 'Accuracy:',
                          infoTitleColor: const Color(0xFFE93F6E),
                          infoValue:
                              '${pokemonMoveDetailsData.accuracy} points',
                          infoValueColor: const Color(0xFF141414),
                          infoFlavor: '///liklihood of landing',
                          infoFlavorColor: const Color(
                            0xFF141414,
                          ).withValues(alpha: 35),
                          tileColor: const Color(0xFFE5E5E5),
                        ),
                        PokemonInfoTileWidget(
                          infoTitle: 'PP:',
                          infoTitleColor: const Color(0xFFE93F6E),
                          infoValue: '${pokemonMoveDetailsData.pp} points',
                          infoValueColor: const Color(0xFFE5E5E5),
                          infoFlavor: '///move attempts',
                          infoFlavorColor: const Color(
                            0xFFB0B0B0,
                          ),
                          tileColor: const Color(0xFF141414),
                        ),
                      ],
                    ),
                  ),
                  sliverHeight16,
                  SliverToBoxAdapter(
                    key: const ValueKey('damageIndexKey'),
                    child:
                        BlocSelector<
                          PokemonMoveDetailsBloc,
                          PokemonMoveDetailsState,
                          bool
                        >(
                          key: key,
                          selector: (isDamageIndexLoading) =>
                              state.damageIndeciesLoading,
                          builder: (context, isDamageIndexLoading) {
                            return PokemonStrengthsAndWeaknessesWidget(
                              strongAgainst: state.strongAgainst,
                              weakAgainst: state.weakAgainst,
                              isDamageIndexLoading: isDamageIndexLoading,
                            );
                          },
                        ),
                  ),
                  sliverHeight16,
                  const SliverToBoxAdapter(
                    child: PokemonHeaderWidget(
                      headerText: 'pokemon list:',
                      fontSize: 10,
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: PokemonMoveDetailsPokemonList(
                      pokemonMoveDetailsPokemonList:
                          state.paginatedPokemonList ?? [],
                      emptyRecords: state.emptyRecords ?? 0,
                      hasBack: state.hasBack,
                      hasNext: state.hasNext,
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
