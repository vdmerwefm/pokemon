import 'package:pokemon_features/src/pokemon_details/widgets/_barrel_pokemon_details.dart';

class PokemonEvolutionChainWidget extends StatelessWidget {
  const PokemonEvolutionChainWidget({
    required this.chainHeader,
    required this.activePokemonName,
    required this.pokemonEvolutionChain,
    super.key,
  });

  final String? chainHeader;
  final String? activePokemonName;
  final List<PokemonFormsModel>? pokemonEvolutionChain;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        HeaderWidget(headerText: chainHeader ?? ''),
        height16,
        Column(
          spacing: 16,
          mainAxisAlignment: MainAxisAlignment.start,
          children: pokemonEvolutionChain!.map(
            (evolutionChain) {
              final isActivePokemon = evolutionChain.name == activePokemonName;
              return PokemonListTileWidget(
                topPadding: 0,
                isActivePokemon: isActivePokemon,
                pokemonSprite: evolutionChain.sprite,
                pokemonName: evolutionChain.name,
                pokemonTypes: evolutionChain.types,
                pokemonId: evolutionChain.id,
                pokemonGenus: evolutionChain.genus,
              );
            },
          ).toList(),
        ),
      ],
    );
  }
}
