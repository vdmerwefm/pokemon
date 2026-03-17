import 'package:flutter/material.dart';
import 'package:pokemon_features/pokemon_features.dart';
import 'package:pokemon_features/src/pokemon_main/widgets/app_bar_bottom_stroke.dart';
import 'package:pokemon_features/src/pokemon_main/widgets/bottom_app_bar_stroke.dart';

class PokemonMainPage extends StatefulWidget {
  const PokemonMainPage({super.key});

  @override
  State<PokemonMainPage> createState() => _PokemonMainPageState();
}

class _PokemonMainPageState extends State<PokemonMainPage> {
  Widget? body = const PokemonListPage();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 8),
            child: Row(
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 4),
                  child: Text('Trainer profile',
                  style: TextStyle(
                        color:  Color(0xFFE93F6E),
                        fontFamily: 'pokemon_font',
                        fontWeight: FontWeight.w900,
                        package: 'pokemon_ui_kit',
                      ),),
                ),
                Icon(
                  Icons.account_box_sharp,
                  size: 50,
                  
                  color: Color(0xFFE93F6E),
                ),
              ],
            ),
          ),
        ],
        scrolledUnderElevation: 0, // Prevents elevation-based color shift
        surfaceTintColor: Colors.transparent,
        title: Image.asset(
          height: 40,
          width: 40,
          'lib/src/assets/images/logo.png',
          package: 'pokemon_ui_kit',
        ),
        backgroundColor: Colors.transparent,
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
      body: body,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        shape: const CircleBorder(),
        backgroundColor: const Color(0xFFE93F6E),
        onPressed: () {},
        child: const Icon(
          Icons.catching_pokemon_sharp,
          color: Colors.white,
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
          color: Colors.white,
          notchMargin: 12,
        ),
      ),
    );
  }
}
