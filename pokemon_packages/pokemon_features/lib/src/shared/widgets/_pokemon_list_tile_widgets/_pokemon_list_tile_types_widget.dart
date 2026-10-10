part of '../_barrel_shared_widgets.dart';

class PokemonListTileTypesWidget extends StatelessWidget {
  const PokemonListTileTypesWidget({
    required this.pokemonTypes,
    this.isActivePokemon = false,
    super.key,
  });

  final List<String> pokemonTypes;
  final bool isActivePokemon;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            PokemonListTypeBadgesWidget(isActivePokemon: isActivePokemon, types: pokemonTypes),
          ],
        ),
      ],
    );
  }
}
