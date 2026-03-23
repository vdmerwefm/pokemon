import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';
import 'package:poke_gql_client/poke_gql_client.dart';
import 'package:pokemon_core/pokemon_core.dart';
import 'package:pokemon_models/pokemon_models.dart';
import 'package:pokemon_repositories/pokemon_repositories.dart';
import 'package:pokemon_repositories/src/mappers/pokemon_details_mapper/pokemon_details_mapper.dart';
import 'package:pokemon_repositories/src/mappers/pokemon_list_mapper/pokemon_list_mapper.dart';

@Injectable(as: IPokemonRepository)
class PokemonRepository implements IPokemonRepository {
  PokemonRepository({
    required PokeGqlClient pokeGqlClient,
  }) : _pokeGqlClient = pokeGqlClient;

  final PokeGqlClient _pokeGqlClient;

  @override
  TaskEither<Failure, List<PokemonListModel>> getPokemonList({
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
  TaskEither<Failure, PokemonDetailsModel> getPokemonDetails(String name) {
    return _pokeGqlClient
        .fetchRawPokemonDetails(name: name)
        .map((rawPokemonDetailsDto) => rawPokemonDetailsDto.toPokemonDetails());
  }
}
