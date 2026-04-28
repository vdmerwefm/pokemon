import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';
import 'package:poke_api_client/poke_api_client.dart';
import 'package:poke_gql_client/poke_gql_client.dart';
import 'package:pokemon_core/pokemon_core.dart';
import 'package:pokemon_models/pokemon_models.dart';
import 'package:pokemon_repositories/pokemon_repositories.dart';
import 'package:pokemon_repositories/src/mappers/pokemon_details_mapper/pokemon_details_mapper.dart';
import 'package:pokemon_repositories/src/mappers/pokemon_list_mapper/pokemon_list_mapper.dart';
import 'package:pokemon_repositories/src/mappers/pokemon_moves_list_mapper/pokemon_moves_list_mapper.dart';
import 'package:pokemon_repositories/src/mappers/type_details_mapper/type_details_mapper.dart';

@Injectable(as: IPokemonRepository)
class PokemonRepository implements IPokemonRepository {
  PokemonRepository({
    required PokeGqlClient pokeGqlClient,
    required PokeApiClient pokeApiClient,
  }) : _pokeGqlClient = pokeGqlClient,
       _pokeApiClient = pokeApiClient;

  final PokeGqlClient _pokeGqlClient;
  final PokeApiClient _pokeApiClient;

  @override
  TaskEither<Failure, List<PokemonListTileModel>> getPokemonList({
    required int limit,
    required int offset,
  }) {
    return _pokeGqlClient
        .fetchRawPokemonList(
          limit: limit,
          offset: offset,
        )
        .map(
          (rawPokemonListDto) => rawPokemonListDto.toPokemonList(),
        );
  }

  @override
  TaskEither<Failure, PokemonDetailsModel> getPokemonDetails({
    required String name,
  }) {
    return _pokeGqlClient
        .fetchRawPokemonDetails(name: name)
        .map((rawPokemonDetailsDto) => rawPokemonDetailsDto.toPokemonDetails());
  }

  @override
  TaskEither<Failure, List<TypeDetailsModel>> getPokemonDamageIndecies({
    required List<String> types,
  }) {
    return TaskEither.traverseList<Failure, String, TypeDetailsModel>(
      types,
      (type) => _pokeApiClient
          .fetchTypeDetails(typeName: type)
          .map((damageTypes) => damageTypes.toTypeDetailsModel()),
    );
  }

  @override
  TaskEither<Failure, List<PokemonMovesListModel>> getPokemonMovesList() {
    return _pokeGqlClient.fetchRawPokemonMovesList().map(
      (rawPokemonMovesList) => rawPokemonMovesList.toPokemonMovesListModel(),
    );
  }
}
