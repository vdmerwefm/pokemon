part of '_barrel_pokemon_move_details.dart';

class PokemonMoveDetailsExpandedTextRowWidget extends StatelessWidget {
  const PokemonMoveDetailsExpandedTextRowWidget({
    required this.text,
    required this.description,
    this.textStyle,
    super.key,
  });

  final String? text;
  final TextStyle? textStyle;
  final String? description;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Text(
            text?.toUpperCase() ?? '',
            style: textStyle ?? pokemonInfoStyle(
              const Color(0xFFE5E5E5),
              fontSize: 8,
            ),
            overflow: TextOverflow.ellipsis,
          ),
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                textAlign: TextAlign.right,
                maxLines: 3,
                description ??
                    '',
                style: pokemonInfoStyle(
                  const Color(0xFFE5E5E5),
                  fontSize: 8,
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
