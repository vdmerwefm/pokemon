/// Barrel file for pokemon_core package, exposing core functionalities
/// pokemon core is generally accessible to all other packages as it contains
/// core functionalities such as app config, failure handling,
/// and service locators
library;

export 'src/configs/app_config.dart';
export 'src/constants/failure_constants.dart';
export 'src/error/failures.dart';
export 'src/pokemon_core.dart';
export 'src/service_locators/app_config_sl.dart';
