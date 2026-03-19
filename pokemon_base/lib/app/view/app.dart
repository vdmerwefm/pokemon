import 'package:flutter/material.dart';
import 'package:pokemon_base/l10n/l10n.dart';
import 'package:pokemon_features/pokemon_features.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        scaffoldBackgroundColor: const Color(0xFF141414),
        appBarTheme: const AppBarTheme(
          color: Color(0xFF141414),
        ),
        bottomAppBarTheme: const BottomAppBarTheme(
          color: Color(0xFF141414),
        ),
        useMaterial3: true,
      ),
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      home: const PokemonMainPage(),
    );
  }
}
