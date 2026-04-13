import 'package:pokemon_features/src/pokemon_details/widgets/_barrel_pokemon_details.dart';

class StrongAgainstWidget extends StatelessWidget {
  const StrongAgainstWidget({
    required this.strongAgainst,
    super.key,
  });

  final List<String>? strongAgainst;


  @override
  Widget build(BuildContext context) {
    return BlocSelector<PokemonDetailsBloc, PokemonDetailsState, bool>(
      selector: (state) => state.damageIndeciesLoading,
      builder: (context, state) {
        if (!state) {
          return Padding(
            padding: (strongAgainst ?? []).isNotEmpty
                ? const EdgeInsets.only(bottom: 16)
                : EdgeInsets.zero,
            child: DetailsTypeBadgesWidget(
              pokemonTypes: strongAgainst ?? [],
              text: 'Strong Against',
            ),
          );
        } else {
          return const SizedBox.shrink();
        }
      },
    );
  }
}
