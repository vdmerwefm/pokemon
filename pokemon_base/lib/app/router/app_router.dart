import 'package:auto_route/auto_route.dart';
import 'package:pokemon_features/pokemon_features.dart';

part 'app_router.gr.dart';

@AutoRouterConfig(modules: [NavigationModule])
class AppRouter extends _$AppRouter {
  AppRouter({super.navigatorKey});


  @override
  List<AutoRoute> get routes => [
    AutoRoute(
      page: PokemonMainRoute.page,
      initial: true,
      children: [
        AutoRoute(
          page: PokemonListRoute.page,
          initial: true,
        ),
      ],
    ),
    CustomRoute(
          page: PokemonDetailsRoute.page,
          transitionsBuilder: TransitionsBuilders.noTransition,
          durationInMilliseconds: 0,
          reverseDurationInMilliseconds: 0,
        ),
  ];
}
