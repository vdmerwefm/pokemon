part of '../presentation/page/pokemon_details_page.dart';

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
            padding: const EdgeInsets.only(bottom:16),
            child: DetailsTypeBadges(
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
