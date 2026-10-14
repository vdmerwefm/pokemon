part of '../_barrel_pokemon_move_list.dart';

class PokemonMoveListTileInfoWidget extends StatelessWidget {
  const PokemonMoveListTileInfoWidget({
    required this.pokemonMoveName,
    required this.pokemonMoveType,
    required this.pokemonMoveId,
    super.key,
  });

  final String pokemonMoveName;
  final String pokemonMoveType;
  final int pokemonMoveId;

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 8,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(
            4,
          ),
          child: Image.asset(
            alignment: Alignment.topCenter,
            PokemonGetTypeUtil.getTypeBadges(
              pokemonMoveType,
            ),
            height: 36,
            width: 36,
            package: 'pokemon_ui_kit',
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(
            top: 10,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,

            children: [
              Text(
                StringUtils.idValidator(
                  pokemonMoveId,
                ).toUpperCase(),
                style: pokemonInfoStyle(
                  const Color(0xFFE5E5E5),
                  fontSize: 10,
                ),
              ),
              Text(
                pokemonMoveName.toUpperCase().split('--').first,
                style: pokemonInfoStyle(
                  const Color(0xFFE5E5E5),
                  fontSize: pokemonMoveName.length > 19
                      ? 8
                      : pokemonMoveName.length > 14
                      ? 12
                      : 14,
                ),
              ),
              height4
            ],
          ),
        ),
      ],
    );
  }
}
