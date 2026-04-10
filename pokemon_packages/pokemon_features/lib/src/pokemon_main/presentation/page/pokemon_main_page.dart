import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokemon_core/pokemon_core.dart';
import 'package:pokemon_features/src/pokemon_main/presentation/bloc/pokemon_main_bloc.dart';
import 'package:pokemon_features/src/pokemon_main/widgets/app_bar_bottom_stroke.dart';
import 'package:pokemon_features/src/pokemon_main/widgets/bottom_app_bar_stroke.dart';

@RoutePage()
class PokemonMainPage extends StatefulWidget {
  const PokemonMainPage({super.key});

  @override
  State<PokemonMainPage> createState() => _PokemonMainPageState();
}

class _PokemonMainPageState extends State<PokemonMainPage> {
  @override
  Widget build(BuildContext context) {
    return AutoRouter(
      builder: (context, content) => BlocProvider(
        create: (context) =>
            sl<PokemonMainBloc>()
              ..add(const PokemonMainEvents.onPlayPokemonThemeMusic()),
        child: BlocBuilder<PokemonMainBloc, PokemonMainState>(
          builder: (context, state) {
            return Scaffold(
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
                scrolledUnderElevation:
                    0, // Prevents elevation-based color shift
                title: context.router.current.path == 'pokemon-details-route'
                    ? GestureDetector(
                        onTap: () async => context.router.maybePop(),
                        child: const Icon(
                          Icons.arrow_back_ios,
                          size: 28,
                          color: Color(0xFFE93F6E),
                        ),
                      )
                    : GestureDetector(
                        onTap: () => context.read<PokemonMainBloc>().add(
                          const PokemonMainEvents.onTogglePokemonThemeMusic(),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(4),
                          child: Image.asset(
                            height: 40,
                            width: 40,
                            'lib/src/assets/images/logo.png',
                            package: 'pokemon_ui_kit',
                          ),
                        ),
                      ),
                bottom: PreferredSize(
                  preferredSize: const Size(16, 16),
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
              floatingActionButtonLocation:
                  FloatingActionButtonLocation.centerDocked,
              floatingActionButton: FloatingActionButton(
                shape: const CircleBorder(),
                backgroundColor: const Color(0xFFE93F6E),
                onPressed: () {},
                child: const Icon(
                  Icons.catching_pokemon_sharp,
                  color: Color(0xFFE5E5E5),
                  size: 40,
                ),
              ),
              bottomNavigationBar: CustomPaint(
                painter: BottomAppBarStroke(
                  color: const Color(0xFFE93F6E),
                  width: 4,
                ),
                child: const BottomAppBar(
                  shape: CircularNotchedRectangle(),
                  notchMargin: 12,
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
