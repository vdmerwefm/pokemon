import 'package:fpdart/fpdart.dart';
import 'package:graphql/client.dart';
import 'package:injectable/injectable.dart';
import 'package:poke_gql_client/src/dio/gql_dio.dart';
import 'package:poke_gql_client/src/models/gql_pokemon_details_dto/gql_pokemon_details_dto.dart';
import 'package:poke_gql_client/src/models/gql_pokemon_list_dto/gql_pokemon_list_dto.dart';
import 'package:poke_gql_client/src/models/gql_pokemon_moves_list_dto/gql_pokemon_moves_list_dto.dart';
import 'package:poke_gql_client/src/queries/gql_pokemon_details_query/gql_pokemon_details_query.dart';
import 'package:poke_gql_client/src/queries/gql_pokemon_list_query/gql_pokemon_list_query.dart';
import 'package:poke_gql_client/src/queries/gql_pokemon_moves_list_query/gql_pokemon_moves_list_query.dart';
import 'package:pokemon_core/pokemon_core.dart';

@injectable
class PokeGqlClient {
  const PokeGqlClient(this.gqlDio);

  final GqlDio gqlDio;

  TaskEither<Failure, GqlPokemonListDto> fetchRawPokemonList({
    required int limit,
    required int offset,
  }) {
    return TaskEither.tryCatch(() async {
      final options = QueryOptions(
        document: gql(gqlPokemonListQuery),
        variables: {'limit': limit, 'offset': offset},
      );

      final response = await gqlDioLink.query(options);
      if (response.data == null) {
        return GqlPokemonListDto.empty();
      } else {
        return GqlPokemonListDto.fromJson({'data': response.data});
      }
    }, (error, stackTrace) => Failure.httpFailure());
  }

  TaskEither<Failure, GqlPokemonDetailsDto> fetchRawPokemonDetails({
    required String name,
  }) {
    return TaskEither.tryCatch(
      () async {
        final options = QueryOptions(
          document: gql(gqlPokemonDetailsQuery),
          variables: {'name': name},
        );

        final response = await gqlDioLink.query(options);
        if (response.data == null) {
          return GqlPokemonDetailsDto.empty();
        } else {
          return GqlPokemonDetailsDto.fromJson({'data': response.data});
        }
      },
      (error, stackTrace) {
        return Failure.httpFailure();
      },
    );
  }

  TaskEither<Failure, GqlPokemonMovesListDto> fetchRawPokemonMovesList() {
    return TaskEither.tryCatch(
      () async {
        final options = QueryOptions(
          document: gql(gqlPokemonMovesListQuery),
        );

        final response = await gqlDioLink.query(options);
        if (response.data == null) {
          return GqlPokemonMovesListDto.empty();
        } else {
          return GqlPokemonMovesListDto.fromJson({'data': response.data});
        }
      },
      (error, stackTrace) {
        return Failure.httpFailure();
      },
    );
  }
}
