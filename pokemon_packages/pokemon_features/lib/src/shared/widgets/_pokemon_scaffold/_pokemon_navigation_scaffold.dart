part of '../_barrel_shared_widgets.dart';

class PokemonNavigationScaffold extends StatelessWidget {
  const PokemonNavigationScaffold({
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
    return Scaffold(
      appBar: const PokemonAppBar(showSearch: true,),
      body: body,
      bottomNavigationBar: CustomPaint(
        painter: BottomAppBarStroke(
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
    );
  }
}
