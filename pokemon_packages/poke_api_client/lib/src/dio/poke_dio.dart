import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:poke_api_client/poke_api_client.dart';
import 'package:pokemon_core/pokemon_core.dart';

@Singleton()
class PokeDio {
  PokeDio() {
    final baseUrl = sl<AppConfig>().pokeBaseUrl;
    final options = BaseOptions(
      baseUrl: baseUrl,
      headers: {
        'Accept': 'application/json',
      },
    );
    _dio = Dio(options);
  }
  
  late final Dio _dio;
  Dio get dio => _dio;
}
