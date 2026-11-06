part of '../_barrel_shared_widgets.dart';

class PokemonListTileImageWidget extends StatelessWidget {
  const PokemonListTileImageWidget({
    required this.pokemonSprite,
    required this.pokemonId,
    super.key,
  });

  final String? pokemonSprite;
  final int? pokemonId;

  @override
  Widget build(BuildContext context) {
    final favoritesList = context
        .watch<PokemonFavoritesBloc>()
        .state
        .pokemonFavoriteIndexList;
    final isFavorite = favoritesList?.contains(pokemonId) ?? false;

    return Stack(
      alignment: Alignment.bottomRight,
      children: [
        ColoredBox(
          color:const Color(0xFF3A3A3A),
          child: CachedNetworkImage(
            cacheManager: PokemonImageCacheManager(),
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
            placeholder: (context, url) =>
                const SizedBox(width: 100, height: 96),
            errorWidget: (context, url, error) => Container(
              color: const Color(0xFF3A3A3A),
              width: 100,
              height: 96,
            ),
          ),
        ),
        if (isFavorite)
          const Icon(
            size: 36,
            Icons.catching_pokemon_sharp,
            color: Color(0xFFE93F6E),
          )
        else
          const SizedBox.shrink(),
      ],
    );
  }
}
