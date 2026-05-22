part of '_barrel_shared_widgets.dart';

class PokemonInfoPill extends StatelessWidget {
  const PokemonInfoPill({
    required this.text,
    this.type,
    super.key,
  });

  final String? text;
  final String? type;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: Platform.isAndroid
          ? const EdgeInsets.only(
              top: 4,
              bottom: 1,
              left: 4,
              right: 4,
            )
          : const EdgeInsets.all(4),
      color: GetTypeUtil.getColor(type ?? ''),
      child: Text(
        (text ?? '').toUpperCase().replaceAll(
          'É',
          'E',
        ),
        style: pokemonInfoStyle(
          type == null || type == 'dark'
              ? const Color(0xFFE5E5E5)
              : const Color(0xFF1A1A1A),
          fontSize: 8,
        ),
        overflow: TextOverflow.ellipsis,
      ),
    );
  }
}
