part of '../_barrel_pokemon_move_details.dart';

class PokemonMoveDetailsCardInfoWidget extends StatelessWidget {
  const PokemonMoveDetailsCardInfoWidget({
    required this.pokemonMoveId,
    required this.pokemonMoveName,
    required this.pokemonMoveType,
    super.key,
  });

  final int pokemonMoveId;
  final String pokemonMoveName;
  final String pokemonMoveType;

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 8,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(
            4,
          ),
          child: Image.asset(
            alignment: Alignment.topCenter,
            GetTypeUtil.getTypeBadges(
              pokemonMoveType,
            ),
            height: 36,
            width: 36,
            package: 'pokemon_ui_kit',
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(
            top: 8,
          ),
          child: Column(
            spacing: 2,
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                StringUtils.idValidator(
                  pokemonMoveId,
                ),
                style: pokemonInfoStyle(
                  const Color(0xFFE5E5E5),
                  fontSize: 10,
                ),
              ),
              Text(
                pokemonMoveName.toUpperCase(),
                style: pokemonInfoStyle(
                  const Color(0xFFE5E5E5),
                  fontSize: 14,
                ),
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
