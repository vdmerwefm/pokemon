part of '../_barrel_shared_widgets.dart';

class PokemonNavigationScaffoldWidget extends StatelessWidget {
  const PokemonNavigationScaffoldWidget({
    required this.body,
    required this.selectedIndex,
    required this.onItemTapped,
    super.key,
  });

  final Widget body;
  final int selectedIndex;
  final void Function(int) onItemTapped;

  @override
  Widget build(BuildContext context) {
    final isPokemonListPageEmpty = context
        .read<PokemonListBloc>()
        .state
        .pokemonList?.isEmpty;
    return Stack(
      children: [
        Scaffold(
          appBar: const PokemonAppBarWidget(
            showSearch: true,
          ),
          body: body,
          bottomNavigationBar: CustomPaint(
            painter: PokemonBottomAppBarStrokeWidget(
              color: const Color(0xFFE93F6E),
              width: 3,
            ),
            child: Padding(
              padding: const EdgeInsets.only(top: 8),
              child: Theme(
                data: Theme.of(
                  context,
                ).copyWith(splashColor: const Color(0xFF141414)),
                child: SizedBox(
                  child: BottomNavigationBar(
                    currentIndex: selectedIndex,
                    onTap: onItemTapped,
                    type: BottomNavigationBarType.fixed,
                    backgroundColor: const Color(0xFF141414),
                    items: const [
                      BottomNavigationBarItem(
                        icon: Icon(Icons.catching_pokemon),
                        label: 'Home',
                      ),
                      BottomNavigationBarItem(
                        icon: Icon(Icons.album_rounded),
                        label: 'Moves',
                      ),
                      BottomNavigationBarItem(
                        icon: Icon(Icons.favorite_sharp),
                        label: 'Favorites',
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          floatingActionButton: const PokemonFloatingActionButton(),
        ),
        PokemonConnectivityPage(isPokemonListPageEmpty: isPokemonListPageEmpty ?? true,),
      ],
    );
  }
}
