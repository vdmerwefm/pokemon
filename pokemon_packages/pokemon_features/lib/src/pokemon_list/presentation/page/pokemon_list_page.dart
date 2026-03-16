import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokemon_core/pokemon_core.dart';
import 'package:pokemon_features/src/pokemon_details/presentation/page/pokemon_details_page.dart';
import 'package:pokemon_features/src/pokemon_list/presentation/bloc/pokemon_list_bloc.dart';

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

          return GridView.builder(
            padding: const EdgeInsets.all(16),
            shrinkWrap: true,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 16,
              crossAxisSpacing: 16,
              mainAxisExtent: 246,
            ),
            itemCount: pokemonList.length,
            itemBuilder: (context, index) {
              final pokemon = pokemonList[index];
              return GestureDetector(
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute<dynamic>(
                    builder: (context) =>
                        PokemonDetailsPage(name: pokemon.name),
                  ),
                ),
                child: Card(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Stack(
                        alignment: AlignmentDirectional.center,
                        children: [
                          Image.network(
                            scale: 0.7,
                            pokemon.sprite,
                            errorBuilder: (context, error, stackTrace) =>
                                const Icon(Icons.catching_pokemon),
                          ),
                        ],
                      ),
                      const Divider(height: 24),
                      const Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            'Types:',
                            style: TextStyle(
                              fontSize: 10,
                              fontFamily: 'pokemon_font',
                              package: 'pokemon_ui_kit',
                            ),
                          ),
                        ],
                      ),
                      const Divider(height: 24),
                      Text(
                        pokemon.name.toUpperCase(),
                        style: const TextStyle(
                          fontFamily: 'pokemon_font',
                          package: 'pokemon_ui_kit',
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
