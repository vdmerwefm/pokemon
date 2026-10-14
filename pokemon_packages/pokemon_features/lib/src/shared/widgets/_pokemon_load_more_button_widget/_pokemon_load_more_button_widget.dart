part of '../_barrel_shared_widgets.dart';

class LoadMoreButtonWidget extends StatefulWidget {
  const LoadMoreButtonWidget({
    required this.isLoadingMore,
    required this.limitReached,
    required this.text,
    required this.loadingText,
    required this.onTap,
    super.key,
  });

  final bool isLoadingMore;
  final bool limitReached;
  final String? text;
  final String? loadingText;
  final VoidCallback onTap;

  @override
  State<LoadMoreButtonWidget> createState() => _LoadMoreButtonWidgetState();
}

class _LoadMoreButtonWidgetState extends State<LoadMoreButtonWidget> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.isLoadingMore == true
          ? () {}
          : () {
              context.read<PokemonAudioBloc>().add(
                const PokemonAudioEvents.onPlaySelectBite(),
              );
              widget.onTap();
            },
      child: widget.limitReached
          ? const SizedBox.shrink()
          : Container(
              margin: const EdgeInsets.all(16),
              color: const Color(0xFFE93F6E),
              width: MediaQuery.sizeOf(context).width,
              height: 50,
              child: Center(
                child: widget.isLoadingMore
                    ? Text(
                        widget.loadingText ?? 'Loading More...',
                        style: pokemonBadgeTextStyle(
                          const Color(0xFFE5E5E5),
                        ),
                      )
                    : Text(
                        widget.text ?? 'Load More',
                        style: pokemonBadgeTextStyle(
                          const Color(0xFFE5E5E5),
                        ),
                      ),
              ),
            ),
    );
  }
}
