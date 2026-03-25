// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i4;
import 'package:flutter/material.dart' as _i5;
import 'package:pokemon_features/src/pokemon_details/presentation/page/pokemon_details_page.dart'
    as _i1;
import 'package:pokemon_features/src/pokemon_list/presentation/page/pokemon_list_page.dart'
    as _i2;
import 'package:pokemon_features/src/pokemon_main/presentation/page/pokemon_main_page.dart'
    as _i3;

abstract class $NavigationModule extends _i4.AutoRouterModule {
  @override
  final Map<String, _i4.PageFactory> pagesMap = {
    PokemonDetailsRoute.name: (routeData) {
      final args = routeData.argsAs<PokemonDetailsRouteArgs>();
      return _i4.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i1.PokemonDetailsPage(
          name: args.name,
          key: args.key,
        ),
      );
    },
    PokemonListRoute.name: (routeData) {
      return _i4.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i2.PokemonListPage(),
      );
    },
    PokemonMainRoute.name: (routeData) {
      return _i4.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i3.PokemonMainPage(),
      );
    },
  };
}

/// generated route for
/// [_i1.PokemonDetailsPage]
class PokemonDetailsRoute extends _i4.PageRouteInfo<PokemonDetailsRouteArgs> {
  PokemonDetailsRoute({
    required String name,
    _i5.Key? key,
    List<_i4.PageRouteInfo>? children,
  }) : super(
          PokemonDetailsRoute.name,
          args: PokemonDetailsRouteArgs(
            name: name,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'PokemonDetailsRoute';

  static const _i4.PageInfo<PokemonDetailsRouteArgs> page =
      _i4.PageInfo<PokemonDetailsRouteArgs>(name);
}

class PokemonDetailsRouteArgs {
  const PokemonDetailsRouteArgs({
    required this.name,
    this.key,
  });

  final String name;

  final _i5.Key? key;

  @override
  String toString() {
    return 'PokemonDetailsRouteArgs{name: $name, key: $key}';
  }
}

/// generated route for
/// [_i2.PokemonListPage]
class PokemonListRoute extends _i4.PageRouteInfo<void> {
  const PokemonListRoute({List<_i4.PageRouteInfo>? children})
      : super(
          PokemonListRoute.name,
          initialChildren: children,
        );

  static const String name = 'PokemonListRoute';

  static const _i4.PageInfo<void> page = _i4.PageInfo<void>(name);
}

/// generated route for
/// [_i3.PokemonMainPage]
class PokemonMainRoute extends _i4.PageRouteInfo<void> {
  const PokemonMainRoute({List<_i4.PageRouteInfo>? children})
      : super(
          PokemonMainRoute.name,
          initialChildren: children,
        );

  static const String name = 'PokemonMainRoute';

  static const _i4.PageInfo<void> page = _i4.PageInfo<void>(name);
}
