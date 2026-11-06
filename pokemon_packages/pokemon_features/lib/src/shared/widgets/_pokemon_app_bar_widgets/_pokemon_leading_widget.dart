import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokemon_features/pokemon_features.dart';
import 'package:pokemon_features/src/helpers/leading_widget_helper.dart';

class PokemonLeadingWidget extends StatelessWidget {
  const PokemonLeadingWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final pokemonId = context
        .watch<PokemonDetailsBloc>()
        .state
        .pokemonDetails
        ?.id;

    final pokemonFavoritesState = context.watch<PokemonFavoritesBloc>().state;
    if (context.router.routeData.name == 'PokemonMainRoute') {
      return LeadingWidgetHelper.leadingWidgetHelper(
        icon: Icons.favorite_rounded,
        size: 28,
        text: (pokemonFavoritesState.pokemonFavoriteIndexList ?? []).length
            .toString()
            .toUpperCase(),
      );
    }

    if (pokemonId == null) {
      return const SizedBox.shrink();
    } else {
      return GestureDetector(
        onTap: () {
          context.read<PokemonFavoritesBloc>()
            ..add(
              PokemonFavoritesEvents.onTogglePokemonFavorites(
                pokemonId: pokemonId,
              ),
            )
            ..add(
              const PokemonFavoritesEvents.onGetPokemonFavoritesList(),
            );

          context.read<PokemonAudioBloc>().add(
            const PokemonAudioEvents.onPlaySelectBite(),
          );
        },
        child:
            ((pokemonFavoritesState.pokemonFavoriteIndexList ?? []).contains(
              pokemonId,
            ))
            ? LeadingWidgetHelper.leadingWidgetHelper(
                icon: Icons.remove_circle_rounded,
                size: 28,
                text: 'REMOVE FROM FAVORITES',
              )
            : LeadingWidgetHelper.leadingWidgetHelper(
                icon: Icons.add_circle_rounded,
                size: 28,
                text: 'ADD TO FAVORITES',
              ),
      );
    }
  }
}
