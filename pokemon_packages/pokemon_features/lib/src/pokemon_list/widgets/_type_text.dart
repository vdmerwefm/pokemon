part of '../presentation/page/pokemon_list_page.dart';

class TypeText extends StatelessWidget {
  const TypeText({
    required this.types,
    super.key,
  });

  final List<String> types;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: types.map((type) {
        return Padding(
          padding: const EdgeInsets.only(top: 4, bottom: 9, right: 9),
          child: Text(
            type.toUpperCase(),
            style: pokemonBadgeTextStyle(
              Colors.white,
            ),
          ),
        );
      }).toList(),
    );
  }
}
