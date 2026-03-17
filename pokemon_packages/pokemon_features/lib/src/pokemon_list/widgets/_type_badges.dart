part of '../presentation/page/pokemon_list_page.dart';

class TypeBadges extends StatelessWidget {
  const TypeBadges({
    required this.types,
    super.key,
  });

  final List<String> types;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      runSpacing: 12,
      direction: Axis.vertical,
      spacing: 12,
      children: types.map((type) {
        return Image.asset(
          getTypeBadges(type),
          package: 'pokemon_ui_kit',
          height: 24,
          width: 24,
        );
      }).toList(),
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
