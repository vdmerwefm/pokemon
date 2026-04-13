import 'package:pokemon_features/src/pokemon_list/widgets/_barrel_pokemon_list.dart';

class LoadMoreButton extends StatefulWidget {
  const LoadMoreButton({super.key});

  @override
  State<LoadMoreButton> createState() => _LoadMoreButtonState();
}

class _LoadMoreButtonState extends State<LoadMoreButton> {
  @override
  Widget build(BuildContext context) {
    final isLoadingMorePokemon = context
        .watch<PokemonListBloc>()
        .state
        .isLoadingMorePokemon;

    return BlocProvider(
      create: (context) => sl<PokemonListBloc>(),
      child: GestureDetector(
        onTap: isLoadingMorePokemon == true
            ? () {}
            : () {
                context.read<PokemonListBloc>().add(
                  const PokemonListEvents.onLoadMorePokemon(),
                );
              },
        child: Container(
          margin: const EdgeInsets.all(16),
          color: const Color(0xFFE93F6E),
          width: MediaQuery.sizeOf(context).width,
          height: 50,
          child: Center(
            child: isLoadingMorePokemon == true
                ? Text(
                    'Loading More Pokemon...',
                    style: pokemonBadgeTextStyle(
                      const Color(0xFFE5E5E5),
                    ),
                  )
                : Text(
                    'Load More Pokemon',
                    style: pokemonBadgeTextStyle(
                      const Color(0xFFE5E5E5),
                    ),
                  ),
          ),
        ),
      ),
    );
  }
}
