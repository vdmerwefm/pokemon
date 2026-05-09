import 'package:flutter/material.dart';
import 'package:pokemon_features/src/pokemon_list/widgets/_barrel_pokemon_list.dart';
import 'package:pokemon_features/src/pokemon_moves_list/presentation/bloc/pokemon_moves_list_bloc.dart';

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
        builder: (context, state) => Text(
          state.pokemonMovesList.toString(),
          style: const TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
