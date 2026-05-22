part of '../_barrel_shared_widgets.dart';

class PokemonListTileImageWidget extends StatelessWidget {
  const PokemonListTileImageWidget({required this.pokemonSprite, super.key});

  final String? pokemonSprite;

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: const Color(0xFF3A3A3A),
      child: CachedNetworkImage(
        cacheManager: PokemonImageCacheManager.pokemonImageCacheManager,
        memCacheHeight: 96,
        memCacheWidth: 100,
        imageUrl: pokemonSprite ?? '',
        imageBuilder: (context, imageProvider) {
          return Transform.scale(
            scale: 1.4,
            child: Image(
              image: imageProvider,
              alignment: Alignment.center,
              fit: BoxFit.contain,
              width: 100,
              height: 96,
            ),
          );
        },
        placeholder: (context, url) => const SizedBox(width: 100, height: 96),
      ),
    );
  }
}
