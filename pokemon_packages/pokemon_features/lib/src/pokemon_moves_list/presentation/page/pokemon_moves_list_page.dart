part of '../../widgets/_barrel_pokemon_move_list.dart';

@RoutePage()
class PokemonMovesListPage extends StatelessWidget {
  const PokemonMovesListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (create) =>
          sl<PokemonMovesListBloc>()
            ..add(const PokemonMovesListEvents.onGetPokemonMovesList()),
      child: BlocBuilder<PokemonMovesListBloc, PokemonMovesListState>(
        builder: (context, state) {
          final pokemonMoveList = state.paginatedPokemonMovesList;
          if (state.pokemonMovesList == null) {
            return const PokemonSkeletonLoaderWidget(
              isPokemonList: false,
              topPadding: 16,
            );
          } else {
            return CustomScrollView(
              slivers: [
                SliverPadding(
                  padding: const EdgeInsetsGeometry.only(
                    left: 16,
                    right: 16,
                  ),
                  sliver: SliverList.builder(
                    itemCount: pokemonMoveList?.length ?? 0,
                    itemBuilder: (context, index) {
                      final pokemonMove = pokemonMoveList?[index];
                      return PokemonMoveTileWidget(
                        pokemonMoveName: pokemonMove?.name ?? '',
                        pokemonMoveType: pokemonMove?.type ?? '',
                        pokemonMoveId: pokemonMove?.id ?? 0,
                        pokemonMoveDamageClass: pokemonMove?.damageClass ?? '',
                      );
                    },
                  ),
                ),
                SliverPadding(
                  padding: const EdgeInsetsGeometry.only(bottom: 24),
                  sliver: SliverToBoxAdapter(
                    child: LoadMoreButtonWidget(
                      isLoadingMore: context
                          .watch<PokemonMovesListBloc>()
                          .state
                          .isLoadingMoreMoves,
                      limitReached: context
                          .watch<PokemonMovesListBloc>()
                          .state
                          .dexLimit,
                      text: 'Load More Moves...',
                      loadingText: 'Loading More Moves...',
                      onTap: () => context.read<PokemonMovesListBloc>().add(
                        const PokemonMovesListEvents.onLoadMorePokemonMoves(),
                      ),
                    ),
                  ),
                ),
              ],
            );
          }
        },
      ),
    );
  }
}
