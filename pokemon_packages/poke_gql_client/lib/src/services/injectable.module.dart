//@GeneratedMicroModule;PokeGqlClientPackageModule;package:poke_gql_client/src/services/injectable.module.dart
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i2;

import 'package:injectable/injectable.dart' as _i1;
import 'package:poke_gql_client/src/dio/gql_dio.dart' as _i3;
import 'package:poke_gql_client/src/poke_gql_client.dart' as _i5;
import 'package:pokemon_core/pokemon_core.dart' as _i4;

class PokeGqlClientPackageModule extends _i1.MicroPackageModule {
  // initializes the registration of main-scope dependencies inside of GetIt
  @override
  _i2.FutureOr<void> init(_i1.GetItHelper gh) {
    gh.singleton<_i3.GqlDio>(() => _i3.GqlDio(gh<_i4.AppConfig>()));
    gh.factory<_i5.PokeGqlClient>(() => _i5.PokeGqlClient(gh<_i3.GqlDio>()));
  }
}
