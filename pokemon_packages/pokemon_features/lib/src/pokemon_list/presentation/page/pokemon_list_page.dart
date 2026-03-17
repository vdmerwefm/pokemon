import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokemon_core/pokemon_core.dart';
import 'package:pokemon_features/src/pokemon_details/presentation/page/pokemon_details_page.dart';
import 'package:pokemon_features/src/pokemon_list/presentation/bloc/pokemon_list_bloc.dart';
import 'package:pokemon_models/pokemon_models.dart';

part '../../widgets/_type_badges.dart';

class PokemonListPage extends StatelessWidget {
  const PokemonListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<PokemonListBloc>()..add(const OnGetPokemonList()),
      child: BlocBuilder<PokemonListBloc, PokemonListState>(
        builder: (context, state) {
          if (state.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          if (state.failure != null) {
            return Center(child: Text(state.failure!.message));
          }

          final pokemonList = state.pokemonList ?? [];

          if (pokemonList.isEmpty) {
            return const Center(child: Text('No Pokemon found'));
          }
          return Padding(
            padding: const EdgeInsets.all(18),
            child: ListView.builder(
              itemCount: pokemonList.length,
              itemBuilder: (context, index) {
                final pokemon = pokemonList[index];
                return pokemonListTile(
                  pokemon: pokemon,
                  context: context,
                  route: MaterialPageRoute<dynamic>(
                    builder: (context) =>
                        PokemonDetailsPage(name: pokemon.name),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}

Widget pokemonListTile({
  required PokemonListModel pokemon,
  required BuildContext context,
  required Route<dynamic> route,
}) {
  return GestureDetector(
    onTap: () => Navigator.push(context, route),
    child: Padding(
      padding: const EdgeInsets.all(8),
      child: SizedBox(
        width: MediaQuery.sizeOf(context).width,
        height: 75,
        child: Wrap(
          direction: Axis.horizontal,
          alignment: WrapAlignment.spaceBetween,
          crossAxisAlignment: WrapCrossAlignment.start,
          children: [
            Wrap(
              direction: Axis.horizontal,
              alignment: WrapAlignment.start,
              children: [
                Image.network(
                  pokemon.sprite,
                  fit: BoxFit.none,
                  width: 75,
                  height: 100,

                ),
                Text(
                  '${pokemon.name.toUpperCase()}\n${idValidator(pokemon.id)}',
                  textAlign: TextAlign.start,
                  style: const TextStyle(
                    fontSize: 20,
                    fontFamily: 'pokemon_font',
                    fontWeight: FontWeight.w800,
                    package: 'pokemon_ui_kit',
                  ),
                ),
              ],
            ),
            Wrap(
              direction: Axis.horizontal,
              alignment: WrapAlignment.center,
              children: [
                TypeBadges(types: pokemon.type),
                const Padding(
                  padding: EdgeInsets.all(16),
                  child: Icon(Icons.arrow_forward_ios),
                ),
              ],
            ),
          ],
        ),
      ),
    ),
  );
}

String idValidator(int id) {
  final pokemonId = id.toString();
  if (pokemonId.length == 1) {
    return '#00$pokemonId';
  } else if (pokemonId.length == 2) {
    return '#0$pokemonId';
  } else {
    return '#$pokemonId';
  }
}

///already_dead
