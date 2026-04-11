part of '../presentation/page/pokemon_details_page.dart';

class PokemonDetailsCard extends StatelessWidget {
  const PokemonDetailsCard({
    required this.pokemonSprite,
    required this.pokemonTypes,
    required this.pokemonId,
    required this.pokemonName,
    required this.pokemonFlavorText,
    required this.pokemonGenus,
    super.key,
  });

  final String? pokemonSprite;
  final List<String>? pokemonTypes;
  final int? pokemonId;
  final String? pokemonName;
  final String? pokemonFlavorText;
  final String? pokemonGenus;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFF1A1A1A),
      width: MediaQuery.sizeOf(context).width,
      height: 208,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          ColoredBox(
            color: const Color(0xFF3A3A3A),
            child: CachedNetworkImage(
              cacheManager: MyImageCacheManager.customCacheManager,
              imageUrl: pokemonSprite ?? '',
              imageBuilder: (context, imageProvider) {
                return Transform.scale(
                  alignment: AlignmentDirectional.center,
                  scale: 1.4,
                  child: Image(
                    image: imageProvider,
                    fit: BoxFit.contain,
                    width: 124,
                    height: 208,
                  ),
                );
              },
              placeholder: (context, url) =>
                  const SizedBox(width: 100, height: 96),
            ),
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.only(bottom: 8, left: 24),
              child: Column(
                spacing: 8,
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    spacing: 8,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(4),
                        child: Image.asset(
                          alignment: Alignment.topCenter,
                          GetTypeBadgeUtil.getTypeBadges(
                            (pokemonTypes ?? []).first,
                          ),
                          height: 36,
                          width: 36,
                          package: 'pokemon_ui_kit',
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 8),
                        child: Column(
                          spacing: 4,
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              StringUtils.idValidator(pokemonId),
                              style: pokemonInfoStyle(
                                const Color(0xFFE5E5E5),
                                fontSize: 8,
                              ),
                            ),
                            Text(
                              (pokemonName ?? '').toUpperCase(),
                              style: pokemonInfoStyle(
                                const Color(0xFFE5E5E5),
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    spacing: 6,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 8),
                        child: Text(
                          StringUtils.restructurePokemonFlavorText(
                            pokemonFlavorText ?? '',
                          ),
                          style: pokemonInfoStyle(
                            const Color(0xFFE5E5E5),
                            fontSize: 6,
                          ),
                        ),
                      ),

                      const PokemonDividerAlt(
                        height: 8,
                        padding: 8,
                      ),
                    ],
                  ),
                  Row(
                    spacing: 8,
                    children: [
                      Container(
                        padding: const EdgeInsets.only(
                          top: 4,
                          bottom: 2,
                          left: 4,
                          right: 4,
                        ),
                        color: const Color(0xFF3A3A3A),
                        child: Text(
                          (pokemonGenus ?? '').toUpperCase().replaceAll(
                            'É',
                            'E',
                          ),
                          style: pokemonInfoStyle(
                            const Color(0xFFE5E5E5),
                            fontSize: 6,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      Row(
                        spacing: 8,
                        children: (pokemonTypes ?? []).map(
                          (type) {
                            return Container(
                              padding: const EdgeInsets.only(
                                top: 4,
                                bottom: 2,
                                left: 4,
                                right: 4,
                              ),
                              color: GetTypeBadgeUtil.getColor(
                                type,
                              ),
                              child: Text(
                                type.toUpperCase(),
                                style: pokemonInfoStyle(
                                  const Color(0xFFE5E5E5),
                                  fontSize: 6,
                                ),
                                overflow: TextOverflow.ellipsis,
                              ),
                            );
                          },
                        ).toList(),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
    //
  }
}
