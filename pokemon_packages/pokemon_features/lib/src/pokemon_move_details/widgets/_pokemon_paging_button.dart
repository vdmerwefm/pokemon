part of '_barrel_pokemon_move_details.dart';

class PokemonPagingButtonWidget extends StatelessWidget {
  const PokemonPagingButtonWidget({
    required this.hasRecords,
    required this.buttonText,
    required this.textStyle,
    required this.pagingCallback,
    super.key,
  });

  final bool hasRecords;
  final String buttonText;
  final TextStyle textStyle;
  final VoidCallback pagingCallback;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: hasRecords
            ? () {
                context.read<PokemonAudioBloc>().add(
                  const PokemonAudioEvents.onPlaySelectBite(),
                );
                pagingCallback.call();
              }
            : () => {},
        child: Container(
          color: hasRecords ? const Color(0xFFE93F6E) : const Color(0xFF3A3A3A),
          height: 50,

          child: Center(
            child: Text(
              buttonText,
              style: textStyle,
              // pokemonBadgeTextStyle(
              //   const Color(0xFFE5E5E5),
              // ),
            ),
          ),
        ),
      ),
    );
  }
}
