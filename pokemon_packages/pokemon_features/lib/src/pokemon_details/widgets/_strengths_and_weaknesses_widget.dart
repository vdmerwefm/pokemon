import 'package:pokemon_features/src/pokemon_details/widgets/_barrel_pokemon_details.dart';

class StrengthsAndWeaknessesWidget extends StatelessWidget {
  const StrengthsAndWeaknessesWidget({
    required this.strongAgainst,
    required this.weakAgainst,
    super.key,
  });

  final List<String>? strongAgainst;
  final List<String>? weakAgainst;

  @override
  Widget build(BuildContext context) {
    return BlocSelector<PokemonDetailsBloc, PokemonDetailsState, bool>(key: key,
      selector: (state) => state.damageIndeciesLoading,
      builder: (context, state) {
        if (!state) {
          return Column(
            key: key,
            children: [
              const HeaderWidget(
                    headerText: 'Strengths and Weaknesses',
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
      },
    );
  }
}
