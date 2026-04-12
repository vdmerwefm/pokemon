import 'package:pokemon_features/src/pokemon_details/widgets/_barrel_pokemon_details.dart';

class StrongAgainstWidget extends StatelessWidget {
  const StrongAgainstWidget({
    required this.pokemonTypes,
    super.key,
  });

  final List<String> pokemonTypes;

  @override
  Widget build(BuildContext context) {
    return BlocSelector<PokemonDetailsBloc, PokemonDetailsState, List<String>?>(
      bloc: context.read<PokemonDetailsBloc>()
        ..add(
          PokemonDetailsEvents.onGetPokemonDamageIndecies(
            types: pokemonTypes,
          ),
        ),
      selector: (state) => state.strongAgainst,
      builder: (context, state) {
        if (state != null) {
          return Padding(
            padding: state.isNotEmpty
                ? const EdgeInsets.only(bottom: 16)
                : EdgeInsets.zero,
            child: DetailsTypeBadgesWidget(
              pokemonTypes: state,
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
