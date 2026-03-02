 import 'package:get_it/get_it.dart';
import 'package:pokemon_core/pokemon_core.dart';

final GetIt appConfigSl = GetIt.instance;

void setUpAppConfig() {
  appConfigSl.registerSingleton<AppConfig>(AppConfig.instance);
}
