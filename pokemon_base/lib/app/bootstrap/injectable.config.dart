// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:poke_api_client/poke_api_client.dart' as _i4;
import 'package:poke_gql_client/poke_gql_client.dart' as _i5;
import 'package:pokemon_audio_kit/pokemon_audio_kit.dart' as _i6;
import 'package:pokemon_core/pokemon_core.dart' as _i3;
import 'package:pokemon_features/pokemon_features.dart' as _i8;
import 'package:pokemon_repositories/pokemon_repositories.dart' as _i7;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  Future<_i1.GetIt> init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    await _i3.PokemonCorePackageModule().init(gh);
    await _i4.PokeApiClientPackageModule().init(gh);
    await _i5.PokeGqlClientPackageModule().init(gh);
    await _i6.PokemonAudioKitPackageModule().init(gh);
    await _i7.PokemonRepositoriesPackageModule().init(gh);
    await _i8.PokemonFeaturesPackageModule().init(gh);
    return this;
  }
}
