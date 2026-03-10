import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:pokemon_core/src/services/core_sl.config.dart';

final GetIt coreSl = GetIt.instance;

@InjectableInit(
  initializerName: 'initializeCoreSl',
  preferRelativeImports: true,
  asExtension: true,
)
void ensureCoreInitialized() => coreSl.initializeCoreSl();
