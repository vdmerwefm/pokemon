import 'package:pokemon_features/src/pokemon_details/widgets/_barrel_pokemon_details.dart';

class WeakAgainstWidget extends StatelessWidget {
  const WeakAgainstWidget({
    required this.weakAgainst,
    super.key,
  });

  final List<String>? weakAgainst;

  @override
  Widget build(BuildContext context) {
    return BlocSelector<PokemonDetailsBloc, PokemonDetailsState, bool>(
      selector: (state) => state.damageIndeciesLoading,
      builder: (context, state) {
        if (!state) {
          return DetailsTypeBadgesWidget(
            pokemonTypes: weakAgainst ?? [],
            text: 'Weak Against',
          );
        } else {
          return const SizedBox.shrink();
        }
      },
    );
  }
}
