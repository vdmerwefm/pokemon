// Reponsible for fetching data and converting to raw dto
import 'package:fpdart/fpdart.dart';
import 'package:poke_api_client/src/dtos/raw_pokemon_list_dto/raw_pokemon.dart';
import 'package:poke_api_client/src/dtos/raw_pokemon_list_dto/raw_pokemon_list_dto.dart';
import 'package:poke_api_client/src/poke_dio/poke_dio.dart';

import 'package:pokemon_core/pokemon_core.dart';

class PokeApiClient {
  PokeApiClient(this.pokeDio);

  final PokeDio pokeDio;
  // TaskEither used to simplify call operation and error handling
  TaskEither<Failure, RawPokemonListDto> fetchRawPokemonList() {
    // reduce need for try catch and error handling logic using 
    // TaskEither.tryCatch extension method
    return TaskEither.tryCatch(() async {
      final response = await pokeDio.dio.get<RawPokemonListDto>('/pokemon');
      // returns response as RawPokemonListDto or empty dto
      return response.data ?? RawPokemonListDto.empty();
       // trows http failure if error occurs during api call
    }, (error, stackTrace) => Failure.httpFailure());
  }

  TaskEither<Failure, RawPokemonDto> getPokemonDetails(String id) {
    return TaskEither.tryCatch(() async {
      final response = await pokeDio.dio.get<RawPokemonDto>('/pokemon/$id');
      // returns response as RawPokemonDto or empty dto
      return response.data ?? RawPokemonDto.empty();
    }, (error, stackTrace) => Failure.httpFailure());
  }
}
