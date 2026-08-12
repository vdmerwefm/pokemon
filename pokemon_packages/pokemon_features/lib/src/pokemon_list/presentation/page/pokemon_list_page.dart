part of '../../widgets/_barrel_pokemon_list.dart';

@RoutePage()
class PokemonListPage extends StatefulWidget {
  const PokemonListPage({super.key});

  @override
  State<PokemonListPage> createState() => _PokemonListPageState();
}

class _PokemonListPageState extends State<PokemonListPage> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<PokemonListBloc>()..add(const OnGetPokemonList()),
      child: BlocBuilder<PokemonListBloc, PokemonListState>(
        builder: (context, state) {
          final pokemonList = state.paginatedPokemonList ?? [];
          final loadingEmptyOrFailure =
              state.isLoading || pokemonList.isEmpty || state.failure != null;

          if (loadingEmptyOrFailure) {
            return const ListSkeletonLoaderWidget();
          }

          return CustomScrollView(
            slivers: [
              SliverPadding(
                padding: const EdgeInsets.only(left: 16, right: 16),
                sliver: SliverList.builder(
                  itemCount: pokemonList.length,
                  addAutomaticKeepAlives: false,
                  addRepaintBoundaries: true,
                  itemBuilder: (context, index) {
                    final pokemon = pokemonList[index];
                    return RepaintBoundary(
                      child: PokemonListTileWidget(
                        key: ValueKey(pokemon.id),
                        //context: context,
                        pokemonName: pokemon.name,
                        pokemonTypes: pokemon.type,
                        pokemonSprite: pokemon.sprite,
                        pokemonId: pokemon.id,
                        pokemonGenus: pokemon.genus,
                      ),
                    );
                  },
                ),
              ),
              SliverPadding(
                padding: const EdgeInsetsGeometry.only(bottom: 24),
                sliver: SliverToBoxAdapter(
                  child: LoadMoreButtonWidget(
                    isLoadingMore: context
                        .watch<PokemonListBloc>()
                        .state
                        .isLoadingMorePokemon,
                    limitReached: context
                        .watch<PokemonListBloc>()
                        .state
                        .dexLimit,
                    text: 'Load More Pokemon...',
                    loadingText: 'Loading More Pokemon...',
                    onTap: () => context.read<PokemonListBloc>().add(
                      const PokemonListEvents.onLoadMorePokemon(),
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

///already_dead
