import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokemon_features/pokemon_features.dart';

class PokemonFilterWidget extends StatelessWidget {
  const PokemonFilterWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocSelector<PokemonFilterBloc, PokemonFilterState, String?>(
      selector: (state) {
        final filterString = state.filterIndex != 0 ? state.filterString : null;

        if (context.router.current.path == 'pokemon-list-page') {
          context.read<PokemonListBloc>().add(
            PokemonListEvents.onGetPokemonList(
              pokmeonFilterString: filterString,
            ),
          );
        }
        if (context.router.current.path == 'pokemon-move-page') {
          context.read<PokemonMovesListBloc>().add(
            PokemonMovesListEvents.onGetPokemonMovesList(
              pokmeonFilterString: filterString,
            ),
          );
        }

        return filterString;
      },
      builder: (context, state) {
        return GestureDetector(
          onTap: () {
            context.read<PokemonFilterBloc>().add(
              const PokemonFilterEvents.onPokemonFilterChanged(),
            );
            context.read<PokemonAudioBloc>().add(
            const PokemonAudioEvents.onPlaySelectBite(),
          );
          },
          child: Row(
            children: [
              const Center(
                child: Text(
                  'MODE:',
                  style: TextStyle(
                    color: Color(0xFFE5E5E5),
                    fontFamily: 'pokemon_font',
                    fontWeight: FontWeight.w900,
                    package: 'pokemon_ui_kit',
                  ),
                ),
              ),
              Center(
                child: Text(
                  ' ${state ?? 'All Types'}'
                      .toUpperCase(),
                  style: const TextStyle(
                    color: Color(0xFFE5E5E5),
                    fontFamily: 'pokemon_font',
                    fontWeight: FontWeight.w900,
                    package: 'pokemon_ui_kit',
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
