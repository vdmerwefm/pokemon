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
    }

    return AutoRouter(
      builder: (context, content) => Scaffold(
        appBar: AppBar(
          centerTitle: false,
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 8),
              child: Row(
                children: [
                  const Padding(
                    padding: EdgeInsets.only(top: 4, right: 4),
                    child: Text(
                      'Trainer profile',
                      style: TextStyle(
                        color: Color(0xFFE93F6E),
                        fontFamily: 'pokemon_font',
                        fontWeight: FontWeight.w900,
                        package: 'pokemon_ui_kit',
                      ),
                    ),
                  ),
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadiusGeometry.circular(4),
                        child: Container(
                          height: 36,
                          width: 36,
                          color: const Color(0xFFE5E5E5),
                        ),
                      ),
                      ClipRRect(
                        borderRadius: BorderRadiusGeometry.circular(10),
                        child: const Icon(
                          Icons.account_box,
                          size: 50,

                          color: Color(0xFFE93F6E),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
          scrolledUnderElevation: 0, // Prevents elevation-based color shift
          title: context.router.current.path == 'pokemon-details-route'
              ? GestureDetector(
                  onTap: () async {
                    context.read<PokemonAudioBloc>().add(
                      const PokemonAudioEvents.onPlaySelectBite(),
                    );
                    await context.router.maybePop();
                  },
                  child: const Icon(
                    Icons.arrow_back_ios,
                    size: 28,
                    color: Color(0xFFE93F6E),
                  ),
                )
              : GestureDetector(
                  onTap: () {
                    context.read<PokemonAudioBloc>().add(
                      const PokemonAudioEvents.onPlaySelectBite(),
                    );
                    context.read<PokemonAudioBloc>().add(
                      const PokemonAudioEvents.onTogglePokemonThemeMusic(),
                    );
                  },
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(4),
                    child: Image.asset(
                      height: 40,
                      width: 40,
                      'lib/src/assets/images/types/logo.png',
                      package: 'pokemon_ui_kit',
                    ),
                  ),
                ),
          bottom: PreferredSize(
            preferredSize: const Size(8, 8),
            child: CustomPaint(
              painter: AppBarBottomStroke(
                color: const Color(0xFFE93F6E),
                width: 3,
              ),
              child: SizedBox(
                width: MediaQuery.sizeOf(context).width,
              ),
            ),
          ),
        ),
        body: content,
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
                height: 85,
                child: BottomNavigationBar(
                  currentIndex: _selectedIndex,
                  onTap: _onItemTapped,
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
                      icon: Icon(Icons.compost_sharp),
                      label: 'Berries',
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(Icons.auto_awesome_sharp),
                      label: 'PGC',
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
