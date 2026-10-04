part of '../_barrel_pokemon_move_details.dart';

class PokemonMoveDetailsCardImage extends StatelessWidget {
  const PokemonMoveDetailsCardImage({required this.type, super.key});

  final String type;

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: const Color(0xFF3A3A3A),
      child: Transform.scale(
        scale: 1.7,
        child: Image.asset(
          scale: 4,
          GetTypeUtil.getMoveImage(
            type,
          ),
          package: 'pokemon_ui_kit',
          fit: BoxFit.contain,
          width: 100,
          height: 208,
        ),
      ),
    );
  }
}
