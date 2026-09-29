import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokemon_core/pokemon_core.dart';
import 'package:pokemon_features/src/pokemon_moves_list/presentation/bloc/pokemon_moves_list_bloc.dart';
import 'package:pokemon_features/src/pokemon_moves_list/widgets/pokemon_move_tile_widget.dart';
import 'package:pokemon_features/src/shared/widgets/_barrel_shared_widgets.dart';

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
            return const SizedBox.shrink();
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
