//@GeneratedMicroModule;PokeApiClientPackageModule;package:poke_api_client/src/services/injectable.module.dart
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i2;

import 'package:injectable/injectable.dart' as _i1;
import 'package:poke_api_client/poke_api_client.dart' as _i5;
import 'package:poke_api_client/src/configs/app_config.dart' as _i3;
import 'package:poke_api_client/src/dio/poke_dio.dart' as _i4;
import 'package:poke_api_client/src/poke_api_client.dart' as _i6;

class PokeApiClientPackageModule extends _i1.MicroPackageModule {
// initializes the registration of main-scope dependencies inside of GetIt
  @override
  _i2.FutureOr<void> init(_i1.GetItHelper gh) {
    gh.singleton<_i3.AppConfig>(() => _i3.AppConfig());
    gh.singleton<_i4.PokeDio>(() => _i4.PokeDio(gh<_i5.AppConfig>()));
    gh.singleton<_i6.PokeApiClient>(() => _i6.PokeApiClient(gh<_i4.PokeDio>()));
  }
}
