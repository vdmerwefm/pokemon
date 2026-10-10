part of '../_barrel_shared_widgets.dart';

class PokemonStrengthsAndWeaknessesWidget extends StatelessWidget {
  const PokemonStrengthsAndWeaknessesWidget({
    required this.strongAgainst,
    required this.weakAgainst,
    required this.isDamageIndexLoading,
    super.key,
  });

  final List<String>? strongAgainst;
  final List<String>? weakAgainst;
  final bool isDamageIndexLoading;

  @override
  Widget build(BuildContext context) {
    if (!isDamageIndexLoading) {
      return Column(
        key: key,
        children: [
          const HeaderWidget(
            headerText: 'Strengths and Weaknesses',
            fontSize: 10,
          ),
          height16,
          Padding(
            padding: (strongAgainst ?? []).isNotEmpty
                ? const EdgeInsets.only(bottom: 16)
                : EdgeInsets.zero,
            child: DetailsTypeBadgesWidget(
              pokemonTypes: strongAgainst ?? [],
              text: 'Strong Against',
            ),
          ),
          DetailsTypeBadgesWidget(
            pokemonTypes: weakAgainst ?? [],
            text: 'Weak Against',
          ),
        ],
      );
    } else {
      return const SizedBox.shrink();
    }
  }
}
