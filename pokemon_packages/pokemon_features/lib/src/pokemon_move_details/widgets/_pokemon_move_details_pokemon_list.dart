part of '_barrel_pokemon_move_details.dart';

class PokemonMoveDetailsPokemonList extends StatelessWidget {
  const PokemonMoveDetailsPokemonList({
    required this.pokemonMoveDetailsPokemonList,
    required this.emptyRecords,
    required this.hasBack,
    required this.hasNext,
    super.key,
  });

  final List<PokemonListTileModel> pokemonMoveDetailsPokemonList;
  final int emptyRecords;
  final bool hasBack;
  final bool hasNext;

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      slivers: [
        SliverList.builder(
          itemCount: pokemonMoveDetailsPokemonList.length,
          itemBuilder: (context, index) {
            final pokemonList = pokemonMoveDetailsPokemonList;
            if (pokemonList[index].id != 0) {
              return PokemonListTileWidget(
                pokemonSprite: pokemonList[index].sprite,
                pokemonName: pokemonList[index].name,
                pokemonTypes: pokemonList[index].type,
                pokemonId: pokemonList[index].id,
                pokemonGenus: pokemonList[index].genus,
              );
            } else {
              return PokemonSkeletonLoaderWidget(
                isPokemonList: true,
                count: 1,
                isEmptyRecord: emptyRecords != 0,
                topPadding: 16,
                leftPadding: 0,
                rightPadding: 0,
              );
            }
          },
        ),
        SliverToBoxAdapter(
          child: Container(
            padding: const EdgeInsets.only(
              top: 16,
              bottom: 16,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              spacing: 16,
              children: [
                PokemonMoveDetailsPagingButtonWidget(
                  hasRecords: hasBack,
                  buttonText: 'BACK',
                  textStyle: pokemonBadgeTextStyle(
                    const Color(0xFFE5E5E5),
                  ),
                  pagingCallback: () =>
                      context.read<PokemonMoveDetailsBloc>().add(
                        const PokemonMoveDetailsEvents.onPageBackPokemonList(),
                      ),
                ),

                PokemonMoveDetailsPagingButtonWidget(
                  hasRecords: hasNext,
                  buttonText: 'NEXT',
                  textStyle: pokemonBadgeTextStyle(
                    const Color(0xFFE5E5E5),
                  ),
                  pagingCallback: () =>
                      context.read<PokemonMoveDetailsBloc>().add(
                        const PokemonMoveDetailsEvents.onPageNextPokemonList(),
                      ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
