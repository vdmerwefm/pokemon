part of '../presentation/page/pokemon_list_page.dart';

class LoadMoreButton extends StatelessWidget {
  const LoadMoreButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<PokemonListBloc>(),
      child: GestureDetector(
        onTap: () => context.read<PokemonListBloc>().add(
          const PokemonListEvents.onLoadMorePokemon(),
        ),
        child: Container(
          margin: const EdgeInsets.all(16),
          color: const Color(0xFFE93F6E),
          width: MediaQuery.sizeOf(context).width,
          height: 50,
          child: Center(
            child: Text(
              'Load More Pokemon',
              style: pokemonBadgeTextStyle(
                Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
