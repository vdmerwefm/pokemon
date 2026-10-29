import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokemon_core/pokemon_core.dart';
import 'package:pokemon_features/src/pokemon_search/presentation/bloc/pokemon_search_bloc.dart';
import 'package:pokemon_features/src/shared/widgets/_barrel_shared_widgets.dart';

@RoutePage()
class PokemonSearchPage extends StatelessWidget {
  const PokemonSearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PokemonSearchBloc, PokemonSearchState>(
      bloc: context.read<PokemonSearchBloc>()
        ..add(const PokemonSearchEvents.onPokemonListSearch()),
      builder: (context, state) {
        final pokemonSearchList = state.pokemonList ?? [];

        if (state.isLoading && pokemonSearchList.isEmpty) {
          return const PokemonScaffoldWidget(
            body: PokemonSkeletonLoaderWidget(
              isPokemonList: true,
              topPadding: 16,
            ),
          );
        }

        if (pokemonSearchList.isEmpty) {
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
            cacheExtent: 25,
            slivers: [
              SliverPadding(
                padding: const EdgeInsets.only(left: 16, right: 16),
                sliver: SliverList.builder(
                  itemCount: pokemonSearchList.length,
                  addAutomaticKeepAlives: false,
                  addRepaintBoundaries: true,
                  itemBuilder: (context, index) {
                    final pokemon = pokemonSearchList[index];
                    return RepaintBoundary(
                      child: PokemonListTileWidget(
                        key: ValueKey(pokemon.id),
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
              sliverHeight64
            ],
          ),
        );
      },
    );
  }
}
