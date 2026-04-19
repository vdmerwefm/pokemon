import 'package:pokemon_features/src/pokemon_details/widgets/_barrel_pokemon_details.dart';
import 'package:pokemon_features/src/pokemon_details/widgets/_pokemon_details_skeleton_loader.dart';
import 'package:pokemon_features/src/pokemon_details/widgets/_pokemon_moves_widget.dart';
import 'package:pokemon_features/src/pokemon_main/widgets/app_bar_bottom_stroke.dart';

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
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 0,
        centerTitle: false,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Padding(
                  padding: EdgeInsets.only(top: 4, right: 4),
                  child: Text(
                    'Trainer profile',
                    style: TextStyle(
                      color: Color(0xFFE93F6E),
                      fontFamily: 'pokemon_font',
                      fontWeight: FontWeight.w900,
                      package: 'pokemon_ui_kit',
                    ),
                  ),
                ),
                Stack(
                  alignment: Alignment.center,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadiusGeometry.circular(4),
                      child: Container(
                        height: 36,
                        width: 36,
                        color: const Color(0xFFE5E5E5),
                      ),
                    ),
                    ClipRRect(
                      borderRadius: BorderRadiusGeometry.circular(10),
                      child: const Icon(
                        Icons.account_box,
                        size: 50,

                        color: Color(0xFFE93F6E),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
        scrolledUnderElevation: 0, // Prevents elevation-based color shift
        title: context.router.current.path != 'pokemon-list-route'
            ? GestureDetector(
                onTap: () async {
                  context.read<PokemonAudioBloc>().add(
                    const PokemonAudioEvents.onPlaySelectBite(),
                  );
                  await context.router.maybePop();
                },
                child: const Icon(
                  Icons.arrow_back_ios,
                  size: 28,
                  color: Color(0xFFE93F6E),
                ),
              )
            : GestureDetector(
                onTap: () {
                  context.read<PokemonAudioBloc>().add(
                    const PokemonAudioEvents.onPlaySelectBite(),
                  );
                  context.read<PokemonAudioBloc>().add(
                    const PokemonAudioEvents.onTogglePokemonThemeMusic(),
                  );
                },
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(4),
                  child: Image.asset(
                    height: 40,
                    width: 40,
                    'lib/src/assets/images/logo.png',
                    package: 'pokemon_ui_kit',
                  ),
                ),
              ),
        bottom: PreferredSize(
          preferredSize: const Size(8, 8),
          child: CustomPaint(
            painter: AppBarBottomStroke(
              color: const Color(0xFFE93F6E),
              width: 3,
            ),
            child: SizedBox(
              width: MediaQuery.sizeOf(context).width,
            ),
          ),
        ),
      ),
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
                    SliverToBoxAdapter(
                      child: PokemonMovesWidget(
                        moveCount: pokemon.levelUpMoves?.length,
                        movesData: pokemon.levelUpMoves,
                      ),
                    ),
                  sliverHeight16,
                  SliverToBoxAdapter(
                    child: PokemonStatsListWidget(
                      pokemonStats: pokemon.stats ?? [],
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
