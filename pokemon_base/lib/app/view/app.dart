import 'package:flutter/material.dart';
import 'package:pokemon_base/app/bootstrap/app_providers.dart';
import 'package:pokemon_base/app/router/app_router.dart';
import 'package:pokemon_base/l10n/l10n.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  final _appRouter = AppRouter();
  @override
  Widget build(BuildContext context) {
    return AppProviders(
      child: MaterialApp.router(
        theme: ThemeData(
          scaffoldBackgroundColor: const Color(0xFF141414),
          appBarTheme: const AppBarTheme(
            color: Color(0xFF141414),
          ),
          bottomAppBarTheme: const BottomAppBarTheme(
            color: Color(0xFF141414),
          ),
          bottomNavigationBarTheme: const BottomNavigationBarThemeData(
            backgroundColor: Color(0xFF141414),
            selectedIconTheme: IconThemeData(
              size: 32
            ),
            selectedItemColor: Color(0xFFE93F6E),
            selectedLabelStyle: TextStyle(
              fontSize: 12,
              fontFamily: 'pokemon_font',
              fontWeight: FontWeight.w900,
              package: 'pokemon_ui_kit',
            ),
            unselectedIconTheme: IconThemeData(
              size: 32
            ),
            unselectedItemColor: Color(0xFFE5E5E5),
            unselectedLabelStyle: TextStyle(
              color: Color(0xFFE5E5E5),
              fontSize: 12,
              fontFamily: 'pokemon_font',
              fontWeight: FontWeight.w900,
              package: 'pokemon_ui_kit',
            ),
          ),
          useMaterial3: true,
        ),
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        routerConfig: _appRouter.config(),
      ),
    );
  }
}
