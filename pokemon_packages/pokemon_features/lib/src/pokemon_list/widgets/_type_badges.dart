import 'package:pokemon_features/src/pokemon_list/widgets/_barrel_pokemon_list.dart';


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
                      const Color(0xFFE5E5E5),
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
                  GetTypeBadgeUtil.getTypeBadges(type),
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
}
