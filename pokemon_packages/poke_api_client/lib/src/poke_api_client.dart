// Reponsible for fetching data and converting to raw dto
import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';
import 'package:poke_api_client/src/dio/poke_dio.dart';
import 'package:poke_api_client/src/models/raw_pokemon_details_dto/raw_pokemon_details_dto.dart';
import 'package:poke_api_client/src/models/raw_pokemon_list_dto/raw_pokemon_list_dto.dart';
import 'package:poke_api_client/src/models/raw_pokemon_species_details_dto/raw_pokemon_species_details_dto.dart';
import 'package:pokemon_core/pokemon_core.dart';

@Singleton()
class PokeApiClient {
  PokeApiClient(this.pokeDio);

  final PokeDio pokeDio;
  TaskEither<Failure, RawPokemonListDto> fetchRawPokemonList() {
    return TaskEither.tryCatch(() async {
      final response = await pokeDio.dio.get<Map<String, dynamic>>('/pokemon');
      if (response.data == null) {
        return RawPokemonListDto.empty();
      } else {
        ///Currently we do not use pokemon types and other data
        ///but we could want some more data to work with in the future
        ///we should in the very least run this query through graphQl
        ///for holistic overview of a pokemon, its type, its sprite etc
        ///details is a good place to show we are able to consume standard 
        ///api responses and its inefficiency is slight
        ///
        return RawPokemonListDto.fromJson(response.data!);
      }
    }, (error, stackTrace) => Failure.httpFailure());
  }

  TaskEither<Failure, RawPokemonDetailsDto> getPokemonDetails(String name) {
    return TaskEither.tryCatch(() async {
      final response = await pokeDio.dio.get<Map<String, dynamic>>(
        '/pokemon/$name',
      );
      if (response.data == null) {
        return RawPokemonDetailsDto.empty();
      } else {
        return RawPokemonDetailsDto.fromJson(response.data!);
      }
    }, (error, stackTrace) => Failure.httpFailure());
  }

  TaskEither<Failure, RawPokemonSpeciesDetailsDto> getPokemonSpeciesDetails(
    String name,
  ) {
    return TaskEither.tryCatch(() async {
      final response = await pokeDio.dio.get<Map<String, dynamic>>(
        '/pokemon-species/$name',
      );
      if (response.data == null) {
        return RawPokemonSpeciesDetailsDto.empty();
      } else {
        return RawPokemonSpeciesDetailsDto.fromJson(response.data!);
      }
    }, (error, stackTrace) => Failure.httpFailure());
  }
}
