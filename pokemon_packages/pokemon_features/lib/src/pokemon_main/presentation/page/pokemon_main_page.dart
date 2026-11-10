part of '../../widgets/_barrel_pokemon_main.dart';

@RoutePage()
class PokemonMainPage extends StatefulWidget {
  const PokemonMainPage({super.key});

  @override
  State<PokemonMainPage> createState() => _PokemonMainPageState();
}

class _PokemonMainPageState extends State<PokemonMainPage> {
  int _selectedIndex = 0;
  List<PageRouteInfo> routes = [
    const PokemonListRoute(),
    const PokemonMovesListRoute(),
    const PokemonFavoritesRoute(),
  ];

  @override
  Widget build(BuildContext context) {
    void _onItemTapped(int index) {
      setState(() {
        _selectedIndex = index;
        context.router.push(routes.elementAt(index));
      });

      final filterState = context.read<PokemonFilterBloc>().state;

      if (_selectedIndex == 0) {
        context.read<PokemonListBloc>().add(
          PokemonListEvents.onGetPokemonList(
            pokmeonFilterString: filterState.filterIndex != 0
                ? filterState.filterString
                : null,
          ),
        );
      }
      if (_selectedIndex == 1) {
        context.read<PokemonMovesListBloc>().add(
          PokemonMovesListEvents.onGetPokemonMovesList(
            pokmeonFilterString: filterState.filterIndex != 0
                ? filterState.filterString
                : null,
          ),
        );
      }

      if (_selectedIndex == 2) {
        context.read<PokemonFilterBloc>()
          .add(const PokemonFilterEvents.onPokemonFilterReset());
      }
      context.read<PokemonAudioBloc>().add(
        const PokemonAudioEvents.onPlaySelectBite(),
      );
    }

    return PokemonAppLifecycle(
      child: AutoRouter(
        builder: (context, body) {
          return PokemonNavigationScaffoldWidget(
            body: body,
            selectedIndex: _selectedIndex,
            onItemTapped: _onItemTapped,
          );
        },
      ),
    );
  }
}
