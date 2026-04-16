import 'package:pokemon_features/src/pokemon_details/widgets/_barrel_pokemon_details.dart';

class PokemonDetailsCardInfoWidget extends StatelessWidget {
  const PokemonDetailsCardInfoWidget({
    required this.pokemonTypes,
    required this.pokemonId,
    required this.pokemonName,
    super.key,
  });

  final List<String>? pokemonTypes;
  final int? pokemonId;
  final String? pokemonName;

  @override
  Widget build(BuildContext context) {
    return Row(
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
            spacing: 2,
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                StringUtils.idValidator(pokemonId ?? 0),
                style: pokemonInfoStyle(
                  const Color(0xFFE5E5E5),
                  fontSize: 10,
                ),
              ),
              Text(
                (pokemonName ?? '').toUpperCase(),
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
