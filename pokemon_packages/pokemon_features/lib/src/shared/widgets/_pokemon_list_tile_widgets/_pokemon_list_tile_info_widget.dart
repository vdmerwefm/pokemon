part of '../_barrel_shared_widgets.dart';

class PokemonListTileInfoWidget extends StatelessWidget {
  const PokemonListTileInfoWidget({
    required this.pokemonName,
    required this.pokemonId,
    required this.pokemonGenus,
    this.isActivePokemon = false,
    super.key,
  });

  final String? pokemonName;
  final int? pokemonId;
  final String? pokemonGenus;
  final bool isActivePokemon;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.only(left: 12, top: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              (pokemonName ?? '').toUpperCase(),
              style: pokemonInfoStyle(
                isActivePokemon
                    ? const Color(0xFF1A1A1A)
                    : const Color(0xFFE5E5E5),
                fontSize: pokemonName!.length > 19
                    ? 12
                    : pokemonName!.length > 14
                    ? 14
                    : null,
              ),
              overflow: TextOverflow.ellipsis,
            ),
            Text(
              StringUtils.idValidator(pokemonId ?? 0),
              style: pokemonInfoStyle(
                isActivePokemon
                    ? const Color(0xFF1A1A1A)
                    : const Color(0xFFE5E5E5),

                fontSize: 16,
              ),
            ),
            Text(
              (pokemonGenus ?? '').toUpperCase().replaceAll('É', 'E'),
              style: pokemonInfoStyle(
                isActivePokemon
                    ? const Color(0xFF1A1A1A)
                    : const Color(0xFFE5E5E5),

                fontSize: 10,
              ),
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }
}
