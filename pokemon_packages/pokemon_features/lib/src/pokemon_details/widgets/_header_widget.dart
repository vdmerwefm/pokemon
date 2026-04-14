import 'package:pokemon_features/src/pokemon_details/widgets/_barrel_pokemon_details.dart';

class HeaderWidget extends StatelessWidget {
  const HeaderWidget({
    required this.headerText,
    super.key,
  });

  final String headerText;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      spacing: 16,
      children: [
        const PokemonDividerWidget(),

        Text(
          headerText.toUpperCase(),
          style: pokemonInfoStyle(
            const Color(0xFFE5E5E5),
            fontSize: 10,
          ),
        ),

        const PokemonDividerWidget(
          height: 2,
        ),
      ],
    );
  }
}
