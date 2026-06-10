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
    const PokemonListRoute(),
    const PokemonMovesListRoute(),
  ];

  @override
  Widget build(BuildContext context) {
    void _onItemTapped(int index) {
      setState(() {
        _selectedIndex = index;
        context.router.push(routes.elementAt(index));
      });
      context.read<PokemonAudioBloc>().add(
        const PokemonAudioEvents.onPlaySelectBite(),
      );
    }

    return PokemonAppLifecycle(
      child: AutoRouter(
        builder: (context, body) => PokemonNavigationScaffold(
          body: body,
          selectedIndex: _selectedIndex,
          onItemTapped: _onItemTapped,
        ),
      ),
    );
  }
}
