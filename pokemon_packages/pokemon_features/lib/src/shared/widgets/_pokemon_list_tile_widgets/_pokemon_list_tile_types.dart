import 'package:pokemon_features/src/pokemon_list/widgets/_barrel_pokemon_list.dart';

class PokemonListTileTypes extends StatelessWidget {
  const PokemonListTileTypes({
    required this.pokemonTypes,
    this.isActivePokemon = false,
    super.key,
  });

  final List<String> pokemonTypes;
  final bool isActivePokemon;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            TypeBadges(
              isActivePokemon: isActivePokemon,
              types: pokemonTypes),
          ],
        ),
      ],
    );
  }
}
