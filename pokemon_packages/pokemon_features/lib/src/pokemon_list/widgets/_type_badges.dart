part of '../presentation/page/pokemon_list_page.dart';

class TypeBadges extends StatelessWidget {
  const TypeBadges({
    required this.types,
    super.key,
  });

  final List<String> types;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        spacing: 8,
        children: [
          Column(
            spacing: 8,
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: types.map((type) {
              return Container(
                padding: const EdgeInsets.only(top: 2),
                height: 24,
                child: Center(
                  child: Text(
                    type.toUpperCase(),
                    style: pokemonBadgeTextStyle(
                      Colors.white,
                    ),
                  ),
                ),
              );
            }).toList(),
          ),
          Column(
            spacing: 8,
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: types.map((type) {
              return ClipRRect(
                borderRadius: BorderRadius.circular(4),
                child: Image.asset(
                  fit: BoxFit.cover,
                  getTypeBadges(type),
                  package: 'pokemon_ui_kit',
                  height: 24,
                  width: 24,
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }

  static String getTypeBadges(String typeFromData) {
    String? badge;
    for (final type in PokemonType.values) {
      if (type.name == typeFromData) {
        badge = type.imagePath;
      }
    }

    return badge ?? '';
  }
}
