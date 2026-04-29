part of '_barrel_pokemon_details.dart';

class PokemonCryWidget extends StatelessWidget {
  const PokemonCryWidget({
    required this.pokemonName,
    required this.pokemonCry,
    super.key,
  });

  final String pokemonName;
  final String pokemonCry;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: () => context.read<PokemonAudioBloc>()
            ..add(
              PokemonAudioEvents.onPlayPokemonCry(
                pokemonCry: pokemonCry,
              ),
            ),
          child: SizedBox(
            child: Row(
              spacing: pokemonCry.isEmpty ? 8 : 0,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const ColoredBox(
                  color: Color(0xFF141414),
                  child: Icon(
                    Icons.play_arrow_rounded,
                    color: Color(0xFFE5E5E5),
                  ),
                ),
                Padding(
                  padding: Platform.isAndroid
                      ? const EdgeInsets.only(top: 2)
                      : const EdgeInsets.only(bottom: 2),
                  child: Text(
                    'PLAY ${pokemonName.toUpperCase()} CRY',
                    style: pokemonInfoStyle(
                      const Color(0xFFE5E5E5),
                      fontSize: 10,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
          ),
        ),
        height12,
        const PokemonDividerWidget(),
      ],
    );
  }
}
