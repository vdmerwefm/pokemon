part of '../_barrel_pokemon_details.dart';

class PokemonDetailsCardGenusWidget extends StatelessWidget {
  const PokemonDetailsCardGenusWidget({
    required this.pokemonGenus,
    required this.pokemonTypes,
    super.key,
  });

  final String? pokemonGenus;
  final List<String>? pokemonTypes;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 2),
      child: Row(
        spacing: 8,
        children: [
          PokemonInfoPillWidget(
            text: pokemonGenus ?? '',
          ),
          Row(
            spacing: 8,
            children: (pokemonTypes ?? []).map(
              (type) {
                return PokemonInfoPillWidget(
                  text: type,
                  type: type,
                );
              },
            ).toList(),
          ),
        ],
      ),
    );
  }
}
