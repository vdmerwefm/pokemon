import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';
import 'package:poke_api_client/poke_api_client.dart';
import 'package:poke_gql_client/poke_gql_client.dart';
import 'package:pokemon_core/pokemon_core.dart';
import 'package:pokemon_models/pokemon_models.dart';
import 'package:pokemon_repositories/pokemon_repositories.dart';
import 'package:pokemon_repositories/src/mappers/pokemon_details_mapper/pokemon_details_mapper.dart';
import 'package:pokemon_repositories/src/mappers/pokemon_list_mapper/pokemon_list_mapper.dart';

@Injectable(as: IPokemonRepository)
class PokemonRepository implements IPokemonRepository {
  PokemonRepository({
    required PokeApiClient pokeApiClient,
    required PokeGqlClient pokeGqlClient,
  }) : _pokeApiClient = pokeApiClient,
       _pokeGqlClient = pokeGqlClient;

  final PokeApiClient _pokeApiClient;
  final PokeGqlClient _pokeGqlClient;

  @override
  TaskEither<Failure, List<PokemonListModel>> getPokemonList() {
    return _pokeGqlClient.fetchRawPokemonList().map(
      (rawPokemonListDto) => rawPokemonListDto.toPokemonList(),
    );
  }

  @override
  TaskEither<Failure, PokemonDetailsModel> getPokemonDetails(String name) {
    return _pokeApiClient
        .getPokemonDetails(name)
        .flatMap(
          (rawPokemonDetails) => _pokeApiClient
              .getPokemonSpeciesDetails(name)
              .map(
                (rawSpeciesDetailsDto) =>
                    rawPokemonDetails.toPokemonDetails(rawSpeciesDetailsDto),
              ),
        );
  }
}
