import 'package:pokemon_features/src/pokemon_list/widgets/_barrel_pokemon_list.dart';

class PokemonListTileWidget extends StatelessWidget {
  const PokemonListTileWidget({
    required this.pokemonSprite,
    required this.pokemonName,
    required this.pokemonTypes,
    required this.pokemonId,
    required this.pokemonGenus,
    super.key,
  });

  final String? pokemonName;
  final List<String>? pokemonTypes;
  final String? pokemonSprite;
  final int? pokemonId;
  final String? pokemonGenus;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => context.router.push(
        PokemonDetailsRoute(
          pokemonName: pokemonName ?? '',
          pokemonTypes: pokemonTypes ?? [],
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.only(top: 16),
        child: Container(
          color: const Color(0xFF1A1A1A),
          width: MediaQuery.sizeOf(context).width,
          height: 96,
          child: Row(
            children: [
              PokemonListTileImageWidget(
                key: ValueKey(pokemonSprite),
                pokemonSprite: pokemonSprite ?? '',
              ),
              PokemonListTileInfoWidget(
                key: ValueKey(pokemonName),
                pokemonName: pokemonName ?? '',
                pokemonId: pokemonId ?? 0,
                pokemonGenus: pokemonGenus ?? '',
              ),
              PokemonListTileTypes(
                key: ValueKey(pokemonTypes),
                pokemonTypes: pokemonTypes ?? [],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
