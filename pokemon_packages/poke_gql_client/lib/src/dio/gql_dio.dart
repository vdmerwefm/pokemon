import 'package:dio/dio.dart';
import 'package:gql_dio_link/gql_dio_link.dart';
import 'package:graphql/client.dart';
import 'package:injectable/injectable.dart';
import 'package:pokemon_core/pokemon_core.dart';

part 'cache/gql_hive_cache.dart';

@singleton
class GqlDio {
  GqlDio(AppConfig appConfig) {
    final options = BaseOptions(
      baseUrl: appConfig.gqlBaseUrl,
      headers: {
        'Accept': 'application/json',
      },
    );

    _dio = Dio(options);
    final Link link = DioLink('', client: _dio);
    _gqlDioLink = GraphQLClient(
      link: link,
      cache: GraphQLCache(),
    );
  }

  late final Dio _dio;
  Dio get dio => _dio;
}

late final GraphQLClient _gqlDioLink;
GraphQLClient get gqlDioLink => _gqlDioLink;
