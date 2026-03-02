import 'package:dio/dio.dart';
import 'package:pokemon_core/pokemon_core.dart';

class PokeDio {
  PokeDio() {
    final options = BaseOptions(
      baseUrl: appConfigSl<AppConfig>().pokeBaseUrl,
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
