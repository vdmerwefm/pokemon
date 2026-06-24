import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokemon_core/pokemon_core.dart';
import 'package:pokemon_features/src/pokemon_move_details/presentation/bloc/pokemon_move_details_bloc.dart';
import 'package:pokemon_features/src/shared/widgets/_barrel_shared_widgets.dart';

@RoutePage()
class PokemonMoveDetailsPage extends StatelessWidget {
  const PokemonMoveDetailsPage({required this.name, super.key});

  final String name;
  @override
  Widget build(BuildContext context) {
    return PokemonScaffold(
      body: BlocProvider(
        create: (context) => sl<PokemonMoveDetailsBloc>()
          ..add(PokemonMoveDetailsEvents.onGetPokemonMoveDetails(name: name)),
        child: BlocBuilder<PokemonMoveDetailsBloc, PokemonMoveDetailsState>(
          builder: (context, state) {
            return Text(
              state.pokemonMoveDetails.toString(),
              style: const TextStyle(color: Colors.white),
            );
          },
        ),
      ),
    );
  }
}
