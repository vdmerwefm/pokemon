part of '../_barrel_pokemon_details.dart';

class PokemonDetailsCardGenusWidget extends StatelessWidget {
  const PokemonDetailsCardGenusWidget({
    required this.pokemonGenus,
    required this.pokemonTypes,
    super.key,
  });

  final String? pokemonGenus;
  final List<String>? pokemonTypes;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 2),
      child: Row(
        spacing: 8,
        children: [
          Container(
            padding: Platform.isAndroid
                ? const EdgeInsets.only(
                    top: 4,
                    bottom: 2,
                    left: 4,
                    right: 4,
                  )
                : const EdgeInsets.all(4),
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
                  padding: Platform.isAndroid
                      ? const EdgeInsets.only(
                          top: 4,
                          bottom: 2,
                          left: 4,
                          right: 4,
                        )
                      : const EdgeInsets.all(4),
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
    );
  }
}
