part of '../presentation/page/pokemon_details_page.dart';

class WeakAgainstWidget extends StatelessWidget {
  const WeakAgainstWidget({
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
      selector: (state) => state.weakAgainst,
      builder: (context, state) {
        if (state != null) {
          return DetailsTypeBadges(
            pokemonTypes: state,
            text: 'Weak Against',
          );
        } else {
          return const SizedBox.shrink();
        }
      },
    );
  }
}
