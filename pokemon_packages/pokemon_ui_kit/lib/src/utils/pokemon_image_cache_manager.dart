import 'package:flutter_cache_manager/flutter_cache_manager.dart';

class PokemonImageCacheManager {
  static final pokemonImageCacheManager = CacheManager(
    Config(
      'pokemon_image',
      stalePeriod: const Duration(days: 5), // Forces data to stay for 30 days
      maxNrOfCacheObjects: 2500,
    ),
  );
}
