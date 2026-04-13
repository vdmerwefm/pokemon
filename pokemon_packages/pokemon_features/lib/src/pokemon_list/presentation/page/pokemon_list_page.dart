import 'package:pokemon_features/src/pokemon_list/widgets/_barrel_pokemon_list.dart';

@RoutePage()
class PokemonListPage extends StatefulWidget {
  const PokemonListPage({super.key});

  @override
  State<PokemonListPage> createState() => _PokemonListPageState();
}

class _PokemonListPageState extends State<PokemonListPage> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<PokemonListBloc>()..add(const OnGetPokemonList()),
      child: BlocBuilder<PokemonListBloc, PokemonListState>(
        builder: (context, state) {
          if (state.failure != null) {
            return Center(
              child: Text(
                state.failure!.message,
                style: pokemonInfoStyle(
                  const Color(0xFFE5E5E5),
                ),
              ),
            );
          }

          final pokemonList = state.pokemonList ?? [];
          final loadingOrEmpty = state.isLoading || pokemonList.isEmpty;

          if (loadingOrEmpty) {
            return const ListSkeletonLoaderWidget();
          }
          return SingleChildScrollView(
            padding: const EdgeInsets.only(bottom: 24),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 16, right: 16),
                  child: ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: pokemonList.length,
                    itemBuilder: (context, index) {
                      final pokemon = pokemonList[index];
                      return PokemonListTileWidget(
                        key: ValueKey(pokemon.id),
                        //context: context,
                        pokemonName: pokemon.name,
                        pokemonTypes: pokemon.type,
                        pokemonSprite: pokemon.sprite,
                        pokemonId: pokemon.id,
                        pokemonGenus: pokemon.genus,
                      );
                    },
                  ),
                ),
                const LoadMoreButton(),
              ],
            ),
          );
        },
      ),
    );
  }
}

///already_dead
