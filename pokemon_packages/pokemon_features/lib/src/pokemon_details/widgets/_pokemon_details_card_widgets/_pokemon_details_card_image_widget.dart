import 'package:pokemon_features/src/pokemon_details/widgets/_barrel_pokemon_details.dart';

class PokemonDetailsCardImageWidget extends StatelessWidget {
  const PokemonDetailsCardImageWidget({
    required this.pokemonSprite,
    super.key,
  });

  final String? pokemonSprite;

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: const Color(0xFF3A3A3A),
      child: CachedNetworkImage(
        cacheManager: PokemonImageCacheManager.pokemonImageCacheManager,
        imageUrl: pokemonSprite ?? '',
        imageBuilder: (context, imageProvider) {
          return Transform.scale(
            alignment: AlignmentDirectional.center,
            scale: 1.3,
            child: Image(
              image: imageProvider,
              fit: BoxFit.contain,
              width: 124,
              height: 208,
            ),
          );
        },
        placeholder: (context, url) => const SizedBox(width: 124, height: 208),
      ),
    );
  }
}
