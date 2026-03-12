//@GeneratedMicroModule;PokemonFeaturesPackageModule;package:pokemon_features/src/services/injectable.module.dart
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i2;

import 'package:injectable/injectable.dart' as _i1;
import 'package:pokemon_features/src/pokemon_list/domain/domain.dart' as _i3;
import 'package:pokemon_features/src/pokemon_list/presentation/pokemon_list_bloc/pokemon_list_bloc.dart'
    as _i5;
import 'package:pokemon_repositories/pokemon_repositories.dart' as _i4;

class PokemonFeaturesPackageModule extends _i1.MicroPackageModule {
// initializes the registration of main-scope dependencies inside of GetIt
  @override
  _i2.FutureOr<void> init(_i1.GetItHelper gh) {
    gh.factory<_i3.GetPokemonDetailsUseCase>(
        () => _i3.GetPokemonDetailsUseCase(gh<_i4.IPokemonRepository>()));
    gh.factory<_i3.GetPokemonListUseCase>(
        () => _i3.GetPokemonListUseCase(gh<_i4.IPokemonRepository>()));
    gh.factory<_i5.PokemonListBloc>(
        () => _i5.PokemonListBloc(gh<_i3.GetPokemonListUseCase>()));
  }
}
