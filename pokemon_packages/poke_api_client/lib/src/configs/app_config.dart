import 'package:injectable/injectable.dart';

@Singleton()
class AppConfig {
  AppConfig();

  static final AppConfig instance = AppConfig();
  static const bool _isConfigInitialized = bool.hasEnvironment('poke_base_url');

  final String pokeBaseUrl = const String.fromEnvironment(
    'poke_base_url',
  );

  bool get isConfigInitialized => _isConfigInitialized;
}
