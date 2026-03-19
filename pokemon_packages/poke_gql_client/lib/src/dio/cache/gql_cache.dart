part of '../gql_dio.dart';

@singleton
class GqlCache {
  const GqlCache(this.cacheDirectory);

  final Directory cacheDirectory;

  @factoryMethod
  @preResolve
  static Future<GqlCache> create() async {
    final cacheDirectory = await getApplicationDocumentsDirectory();
    return GqlCache(cacheDirectory);
  }
}
