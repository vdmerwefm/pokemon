part of '../presentation/page/pokemon_details_page.dart';

class DetailsTypeBadges extends StatelessWidget {
  const DetailsTypeBadges({
    required this.pokemonTypes,
    required this.text,
    super.key,
  });

  final String text;
  final List<String> pokemonTypes;

  @override
  Widget build(BuildContext build) {
    return Row(
      spacing: 8,
      children: [
        Container(
          alignment: Alignment.center,
          width: 108,
          padding: const EdgeInsets.only(
            top: 8,
            bottom: 4,
            left: 8,
            right: 8,
          ),
          color: const Color(0xFF3A3A3A),
          child: Text(
            text.toUpperCase(),
            style: pokemonInfoStyle(
              const Color(0xFFE5E5E5),
              fontSize: 12,
            ),
            overflow: TextOverflow.ellipsis,
          ),
        ),
        Row(
          spacing: 8,
          children: pokemonTypes.map((type) {
              return Image.asset(
                fit: BoxFit.cover,
                GetTypeBadgeUtil.getTypeBadges(type),
                package: 'pokemon_ui_kit',
                height: 28,
                width: 28,
              );
            }).toList(),
        ),
      ],
    );
  }
}
