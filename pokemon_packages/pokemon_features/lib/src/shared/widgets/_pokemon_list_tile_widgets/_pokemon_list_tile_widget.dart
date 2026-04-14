import 'package:pokemon_features/src/pokemon_list/widgets/_barrel_pokemon_list.dart';

class PokemonListTileWidget extends StatelessWidget {
  const PokemonListTileWidget({
    required this.pokemonSprite,
    required this.pokemonName,
    required this.pokemonTypes,
    required this.pokemonId,
    required this.pokemonGenus,
    this.topPadding,
    this.isActivePokemon = false,
    super.key,
  });

  final String? pokemonName;
  final List<String>? pokemonTypes;
  final String? pokemonSprite;
  final int? pokemonId;
  final String? pokemonGenus;
  final double? topPadding;
  final bool isActivePokemon;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: isActivePokemon
          ? () {}
          : () => context.router.popAndPush(
              PokemonDetailsRoute(
                pokemonName: pokemonName ?? '',
                pokemonTypes: pokemonTypes ?? [],
              ),
            ),
      child: Padding(
        padding: EdgeInsets.only(top: topPadding ?? 16),
        child: Container(
          color: isActivePokemon
              ? const Color(0xFFE5E5E5)
              : const Color(0xFF1A1A1A),
          width: MediaQuery.sizeOf(context).width,
          height: 96,
          child: Row(
            children: [
              PokemonListTileImageWidget(
                key: ValueKey(pokemonSprite),
                pokemonSprite: pokemonSprite ?? '',
              ),
              PokemonListTileInfoWidget(
                isActivePokemon: isActivePokemon,
                key: ValueKey(pokemonName),
                pokemonName: pokemonName ?? '',
                pokemonId: pokemonId ?? 0,
                pokemonGenus: pokemonGenus ?? '',
              ),
              PokemonListTileTypes(
                isActivePokemon: isActivePokemon,
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
