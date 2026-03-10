import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:pokemon_features/src/services/feature_sl.config.dart';

final GetIt featureSl = GetIt.instance;

@InjectableInit(
  initializerName: 'initializeFeatureSl',
  preferRelativeImports: true,
  asExtension: true,
)

void ensureFeatureInitialized() => featureSl.initializeFeatureSl();
