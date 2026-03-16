import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokemon_core/pokemon_core.dart';
import 'package:pokemon_features/src/pokemon_details/presentation/bloc/pokemon_details_bloc.dart';

class PokemonDetailsPage extends StatelessWidget {
  const PokemonDetailsPage({required this.name, super.key});
  final String name;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pokemon Details'),
      ),
      body: PokemonDetailsView(name: name),
    );
  }
}

class PokemonDetailsView extends StatelessWidget {
  const PokemonDetailsView({required this.name, super.key});

  final String name;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          sl<PokemonDetailsBloc>()
            ..add(PokemonDetailsEvents.onGetPokemonDetails(name: name)),
      child: BlocBuilder<PokemonDetailsBloc, PokemonDetailsState>(
        builder: (context, state) {
          if (state.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          if (state.failure != null) {
            return Center(child: Text(state.failure!.message));
          }

          final pokemon = state.pokemonDetails;
          final pokemonStats = state.pokemonDetails?.stats;
          final pokemonTypes = state.pokemonDetails?.type;

          if (pokemon == null) {
            return const Center(child: Text('No details found'));
          }

          return SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.network(
                  pokemon.sprite,
                  scale: 0.35,
                  fit: BoxFit.fitWidth,
                  errorBuilder: (context, error, stackTrace) =>
                      const Icon(Icons.catching_pokemon, size: 100),
                ),
                const SizedBox(height: 16),
                Text(
                  pokemon.name?.toUpperCase() ?? '',
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  pokemon.genus ?? '',
                  style: const TextStyle(
                    fontSize: 18,
                    fontStyle: FontStyle.italic,
                    color: Colors.grey,
                  ),
                ),
                Text(
                  pokemon.flavorText ?? '',
                  style: const TextStyle(
                    fontSize: 18,
                    fontStyle: FontStyle.italic,
                    color: Colors.grey,
                  ),
                ),
                const Divider(height: 32),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _infoColumn(label: 'Height', value: '${pokemon.height}'),
                    _infoColumn(label: 'Weight', value: '${pokemon.weight}'),
                    _infoColumn(label: 'Ability', value: pokemon.ability ?? ''),
                  ],
                ),
                const SizedBox(height: 16),
                const Divider(height: 32),
                ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: pokemonTypes!.length,
                  itemBuilder: (context, index) {
                    final pokemon = pokemonTypes[index];
                    return ListTile(
                      title: Text(
                        pokemon.type.toString().toUpperCase(),
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                    );
                  },
                ),
                const SizedBox(height: 16),
                const Divider(height: 32),
                ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: pokemonStats?.length,
                  itemBuilder: (context, index) {
                    final pokemon = pokemonStats?[index];
                    return ListTile(
                      leading: Text(pokemon!.statName.toUpperCase()),
                      title: Text(
                        pokemon.baseStat.toString().toUpperCase(),
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                    );
                  },
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _infoColumn({required String label, required String value}) {
    return Column(
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          value,
          style: const TextStyle(fontSize: 16),
        ),
      ],
    );
  }
}
