import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokemon_core/pokemon_core.dart';
import 'package:pokemon_features/src/pokemon_moves_list/widgets/_barrel_pokemon_move_list.dart';
import 'package:pokemon_features/src/pokemon_search/presentation/bloc/pokemon_search_bloc.dart';
import 'package:pokemon_features/src/shared/widgets/_barrel_shared_widgets.dart';

@RoutePage()
class PokemonMoveSearchPage extends StatelessWidget {
  const PokemonMoveSearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PokemonSearchBloc, PokemonSearchState>(
      bloc: context.read<PokemonSearchBloc>()
        ..add(const PokemonSearchEvents.onPokemonMoveSearch()),
      builder: (context, state) {
        final moveSearchList = state.pokemonMoves ?? [];

        if (state.isLoading && moveSearchList.isEmpty) {
          return const PokemonScaffoldWidget(
            body: PokemonSkeletonLoaderWidget(
              isPokemonList: false,
              topPadding: 16,
            ),
          );
        }

        if (moveSearchList.isEmpty) {
          return PokemonScaffoldWidget(
            body: LoadMoreButtonWidget(
              isLoadingMore: false,
              limitReached: false,
              text: 'uh-oh no results for this search'.toUpperCase(),
              loadingText: '',
              onTap: () {},
            ),
          );
        }

        return PokemonScaffoldWidget(
          body: CustomScrollView(
            slivers: [
              SliverPadding(
                padding: const EdgeInsetsGeometry.only(
                  left: 16,
                  right: 16,
                ),
                sliver: SliverList.builder(
                  itemCount: moveSearchList.length,
                  itemBuilder: (context, index) {
                    final pokemonMove = moveSearchList[index];
                    return PokemonMoveTileWidget(
                      pokemonMoveName: pokemonMove.name ?? '',
                      pokemonMoveType: pokemonMove.type ?? '',
                      pokemonMoveId: pokemonMove.id ?? 0,
                      pokemonMoveDamageClass: pokemonMove.damageClass ?? '',
                    );
                  },
                ),
              ),
              sliverHeight64
            ],
          ),
        );
      },
    );
  }
}
