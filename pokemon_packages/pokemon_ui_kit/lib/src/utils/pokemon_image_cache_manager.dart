import 'package:flutter_cache_manager/flutter_cache_manager.dart';

class PokemonImageCacheManager extends CacheManager {

  factory PokemonImageCacheManager() {
    return _cacheManager;
  }
  
  PokemonImageCacheManager.cacheManager()
    : super(
        Config(
          'pokemon_image',
          stalePeriod: const Duration(
            days: 7,
          ),
          maxNrOfCacheObjects: 25,
          repo: JsonCacheInfoRepository(databaseName: 'pokemon_image_cache'),
          fileService: HttpFileService(),
        ),
      );

  static final PokemonImageCacheManager _cacheManager =
      PokemonImageCacheManager.cacheManager();
}
