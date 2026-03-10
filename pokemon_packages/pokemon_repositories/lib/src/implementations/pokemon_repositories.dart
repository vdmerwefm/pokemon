import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';
import 'package:poke_api_client/poke_api_client.dart';
import 'package:pokemon_core/pokemon_core.dart';
import 'package:pokemon_models/pokemon_models.dart';
import 'package:pokemon_repositories/pokemon_repositories.dart';
import 'package:pokemon_repositories/src/mappers/pokemon_details_mapper/pokemon_details_mapper.dart';
import 'package:pokemon_repositories/src/mappers/pokemon_list_mapper/pokemon_list_mapper.dart';

@injectable
class PokemonRepository implements IPokemonRepository {
  PokemonRepository({ required PokeApiClient pokeApiClient}) : _pokeApiClient = pokeApiClient;
  final PokeApiClient _pokeApiClient;

  @override
  TaskEither<Failure, List<PokemonListModel>> getPokemonList() {
    return _pokeApiClient
        .fetchRawPokemonList()
        .map((rawPokemonListDto) => rawPokemonListDto.toPokemonList());
       
  }

  @override
  TaskEither<Failure, PokemonDetailsModel> getPokemonDetails(String id) {
    return _pokeApiClient
        .getPokemonDetails(id)
        .flatMap(
          (rawPokemonDetails) => _pokeApiClient
              .getPokemonSpeciesDetails(id)
              .map(
                (rawSpeciesDetailsDto) =>
                    rawPokemonDetails.toPokemonDetails(rawSpeciesDetailsDto),
              )
           
        );
  }
}
