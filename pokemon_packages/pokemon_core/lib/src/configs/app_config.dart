class AppConfig {
  AppConfig._();

  static final AppConfig instance = AppConfig._();
  static const bool _isConfigInitialized = bool.hasEnvironment('poke_base_url');

  final String pokeBaseUrl = const String.fromEnvironment(
    'poke_base_url',
    defaultValue: 'https://pokeapi.co/api/v2',
  );

  bool get isConfigInitialized => _isConfigInitialized;
}
