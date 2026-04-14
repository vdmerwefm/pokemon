import 'package:pokemon_features/src/pokemon_details/widgets/_barrel_pokemon_details.dart';

class PokemonEvolutionChainWidget extends StatelessWidget {
  const PokemonEvolutionChainWidget({
    required this.pokemonEvolutionChain,
    super.key,
  });

  final List<String>? pokemonEvolutionChain;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PokemonDetailsBloc, PokemonDetailsState>(
      bloc: context.read<PokemonDetailsBloc>()
        ..add(
          PokemonDetailsEvents.onGetPokemonEvolutionChain(
            names: pokemonEvolutionChain ?? [],
          ),
        ),
      builder: (context, state) {
        if (state.pokemonEvolutionChain != null) {
          return Column(
            spacing: 16,
            mainAxisAlignment: MainAxisAlignment.start,
            children: state.pokemonEvolutionChain!.map(
              (evolutionChain) {
                final isActivePokemon =
                    evolutionChain.name == state.pokemonDetails?.name;

                return PokemonListTileWidget(
                  topPadding: 0,
                  isActivePokemon: isActivePokemon,
                  pokemonSprite: evolutionChain.sprite,
                  pokemonName: evolutionChain.name,
                  pokemonTypes: evolutionChain.type,
                  pokemonId: evolutionChain.id,
                  pokemonGenus: evolutionChain.genus,
                );
              },
            ).toList(),
          );
        } else {
          return const SizedBox.shrink();
        }
      },
    );
  }
}
