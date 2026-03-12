//@GeneratedMicroModule;PokemonFeaturesPackageModule;package:pokemon_features/src/services/injectable.module.dart
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i2;

import 'package:injectable/injectable.dart' as _i1;
import 'package:pokemon_features/src/pokemon_details/domain/domain_leaf.dart'
    as _i3;
import 'package:pokemon_features/src/pokemon_details/presentation/bloc/pokemon_details_bloc.dart'
    as _i6;
import 'package:pokemon_features/src/pokemon_list/domain/domain_leaf.dart'
    as _i5;
import 'package:pokemon_features/src/pokemon_list/presentation/bloc/pokemon_list_bloc.dart'
    as _i7;
import 'package:pokemon_repositories/pokemon_repositories.dart' as _i4;

class PokemonFeaturesPackageModule extends _i1.MicroPackageModule {
// initializes the registration of main-scope dependencies inside of GetIt
  @override
  _i2.FutureOr<void> init(_i1.GetItHelper gh) {
    gh.factory<_i3.GetPokemonDetailsUseCase>(
        () => _i3.GetPokemonDetailsUseCase(gh<_i4.IPokemonRepository>()));
    gh.factory<_i5.GetPokemonListUseCase>(
        () => _i5.GetPokemonListUseCase(gh<_i4.IPokemonRepository>()));
    gh.factory<_i6.PokemonDetailsBloc>(
        () => _i6.PokemonDetailsBloc(gh<_i3.GetPokemonDetailsUseCase>()));
    gh.factory<_i7.PokemonListBloc>(
        () => _i7.PokemonListBloc(gh<_i5.GetPokemonListUseCase>()));
  }
}
