import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:poke_api_client/poke_api_client.dart';

@Singleton()
class PokeDio {
  PokeDio(AppConfig appConfig) {
    final options = BaseOptions(
      baseUrl: appConfig.pokeBaseUrl,
      headers: {
        'Accept': 'application/json',
      },
    );
    _dio = Dio(options);
  }
  
  late final Dio _dio;
  Dio get dio => _dio;
}
