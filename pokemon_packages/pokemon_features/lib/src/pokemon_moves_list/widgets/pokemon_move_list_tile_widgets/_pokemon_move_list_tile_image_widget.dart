part of '../_barrel_pokemon_move_list.dart';

class PokemonMoveListTileImageWidget extends StatelessWidget {
  const PokemonMoveListTileImageWidget({
    required this.pokemonMoveType,
    super.key,
  });

  final String pokemonMoveType;

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: const Color(0xFF3A3A3A),
      child: Transform.scale(
        scale: 1.7,
        child: Image.asset(
          GetTypeUtil.getMoveImage(
            pokemonMoveType,
          ),
          alignment: Alignment.center,
          package: 'pokemon_ui_kit',
          fit: BoxFit.contain,
          width: 100,
          height: 96,
        ),
      ),
    );
  }
}
