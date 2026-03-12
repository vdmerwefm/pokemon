import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokemon_core/pokemon_core.dart';
import 'package:pokemon_features/src/pokemon_details/presentation/page/pokemon_details_page.dart';
import 'package:pokemon_features/src/pokemon_list/presentation/bloc/pokemon_list_bloc.dart';

class PokemonListPage extends StatelessWidget {
  const PokemonListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pokedex'),
      ),
      body: BlocProvider(
        create: (context) =>
            sl<PokemonListBloc>()..add(const OnGetPokemonList()),
        child: const PokemonListView(),
      ),
    );
  }
}

class PokemonListView extends StatelessWidget {
  const PokemonListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PokemonListBloc, PokemonListState>(
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

        return ListView.builder(
          itemCount: pokemonList.length,
          itemBuilder: (context, index) {
            final pokemon = pokemonList[index];
            return ListTile(
              leading: Image.network(  
                scale: 0.1,
                pokemon.icon,
                errorBuilder: (context, error, stackTrace) =>
                    const Icon(Icons.catching_pokemon),
              ),
              title: Text(
                pokemon.name.toUpperCase(),
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute<dynamic>(
                    builder: (context) =>
                        PokemonDetailsPage(name: pokemon.name),
                  ),
                );
              },
            );
          },
        );
      },
    );
  }
}
