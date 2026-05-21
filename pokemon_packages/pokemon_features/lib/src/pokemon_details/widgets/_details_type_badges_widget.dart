part of '_barrel_pokemon_details.dart';

class DetailsTypeBadgesWidget extends StatelessWidget {
  const DetailsTypeBadgesWidget({
    required this.pokemonTypes,
    required this.text,
    super.key,
  });

  final String text;
  final List<String> pokemonTypes;

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: pokemonTypes.isNotEmpty ? 8 : 0,
      children: [
        if (pokemonTypes.isNotEmpty)
          Container(
            alignment: Alignment.center,
            width: 100,
            padding: Platform.isAndroid
                ? const EdgeInsets.only(
                    top: 8,
                    bottom: 6,
                    left: 8,
                    right: 8,
                  )
                : const EdgeInsets.all(8),
            color: const Color(0xFF3A3A3A),
            child: Text(
              text.toUpperCase(),
              style: pokemonInfoStyle(
                const Color(0xFFE5E5E5),
                fontSize: 8,
              ),
              overflow: TextOverflow.ellipsis,
            ),
          )
        else
          const SizedBox.shrink(),
        Row(
          mainAxisSize: MainAxisSize.min,
          spacing: 8,
          children: pokemonTypes.map((type) {
            return Image.asset(
              fit: BoxFit.contain,
              GetTypeUtil.getTypeBadges(type),
              package: 'pokemon_ui_kit',
              height: 20,
              width: 20,
            );
          }).toList(),
        ),
      ],
    );
  }
}
