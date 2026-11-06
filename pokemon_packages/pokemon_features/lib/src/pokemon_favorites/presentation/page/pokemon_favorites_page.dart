import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokemon_core/pokemon_core.dart';
import 'package:pokemon_features/src/pokemon_favorites/presentation/bloc/pokemon_favorites_bloc.dart';
import 'package:pokemon_features/src/shared/widgets/_barrel_shared_widgets.dart';

@RoutePage()
class PokemonFavoritesPage extends StatelessWidget {
  const PokemonFavoritesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PokemonFavoritesBloc, PokemonFavoritesState>(
      bloc: context.read<PokemonFavoritesBloc>()
        ..add(const PokemonFavoritesEvents.onGetPokemonFavoritesList()),
      builder: (context, state) {
        final pokemonFavorites = state.pokemonFavoritesList ?? [];
        final emptyOrFailure = state.isLoading || state.failure != null;

        if (emptyOrFailure) {
          return const PokemonSkeletonLoaderWidget(
            isPokemonList: true,
            topPadding: 16,
          );
        }

        if (pokemonFavorites.isEmpty) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              LoadMoreButtonWidget(
                isLoadingMore: false,
                limitReached: false,
                text: 'You havent caught any pokemon yet'.toUpperCase(),
                loadingText: null,
                onTap: () {},
              ),
            ],
          );
        }

        return CustomScrollView(
          cacheExtent: 25,
          slivers: [
            SliverPadding(
              padding: const EdgeInsets.only(left: 16, right: 16),
              sliver: SliverList.builder(
                itemCount: pokemonFavorites.length,
                addAutomaticKeepAlives: false,
                addRepaintBoundaries: true,
                itemBuilder: (context, index) {
                  final pokemon = pokemonFavorites[index];
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
            sliverHeight16
          ],
        );
      },
    );
  }
}
