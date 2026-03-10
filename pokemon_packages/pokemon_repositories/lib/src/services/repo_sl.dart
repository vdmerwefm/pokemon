import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:pokemon_repositories/src/services/repo_sl.config.dart';

final GetIt repoSl = GetIt.instance;

@InjectableInit(
  initializerName: 'initializeRepoSl',
  preferRelativeImports: true,
  asExtension: true,
)

void ensureRepoInitialized() => repoSl.initializeRepoSl();
