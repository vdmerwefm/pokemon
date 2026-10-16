part of '../_barrel_pokemon_details.dart';

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
        cacheManager: PokemonImageCacheManager(),
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
        errorWidget: (context, url, error) => Container(
          color: const Color(0xFF3A3A3A),
          width: 124,
          height: 208,
        ),
      ),
    );
  }
}
