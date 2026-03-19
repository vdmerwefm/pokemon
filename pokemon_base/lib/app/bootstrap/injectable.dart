import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:poke_api_client/poke_api_client.dart';
import 'package:poke_gql_client/poke_gql_client.dart';
import 'package:pokemon_base/app/bootstrap/injectable.config.dart';
import 'package:pokemon_core/pokemon_core.dart';
import 'package:pokemon_features/pokemon_features.dart';
import 'package:pokemon_repositories/pokemon_repositories.dart';

@InjectableInit(
  includeMicroPackages: true,
  externalPackageModulesBefore: [
    ExternalModule(PokemonCorePackageModule),
    ExternalModule(PokeApiClientPackageModule),
    ExternalModule(PokeGqlClientPackageModule),
    ExternalModule(PokemonRepositoriesPackageModule),
    ExternalModule(PokemonFeaturesPackageModule),
  ],
)
Future<GetIt> configureDependencies() => sl.init();
