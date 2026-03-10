import 'package:dio/dio.dart';
import 'package:pokemon_core/pokemon_core.dart';

class PokeDio {
  PokeDio() {
    final baseUrl = coreSl<AppConfig>().pokeBaseUrl;

    final options = BaseOptions(
      baseUrl: baseUrl,
      connectTimeout: const Duration(seconds: 5),
      receiveTimeout: const Duration(seconds: 5),
      headers: {
        'Accept': 'application/json',
      },
    );
    _dio = Dio(options);
  }

  late final Dio _dio;
  Dio get dio => _dio;
}
