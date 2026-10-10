part of '../_barrel_shared_widgets.dart';

class PokemonHeaderWidget extends StatelessWidget {
  const PokemonHeaderWidget({
    required this.headerText,
    required this.fontSize,
    super.key,
  });

  final String headerText;
  final double fontSize;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      spacing: 16,
      children: [
        const PokemonDividerWidget(),

        Text(
          headerText.toUpperCase(),
          style: pokemonInfoStyle(
            const Color(0xFFE5E5E5),
            fontSize: fontSize,
          ),
        ),

        const PokemonDividerWidget(),
      ],
    );
  }
}
