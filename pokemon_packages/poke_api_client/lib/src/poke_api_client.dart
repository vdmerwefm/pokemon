// Reponsible for fetching data and converting to raw dto
import 'package:fpdart/fpdart.dart';
import 'package:poke_api_client/src/dio/poke_dio.dart';
import 'package:poke_api_client/src/models/raw_pokemon_details_dto/raw_pokemon_details_dto.dart';
import 'package:poke_api_client/src/models/raw_pokemon_list_dto/raw_pokemon_list_dto.dart';
import 'package:poke_api_client/src/models/raw_pokemon_species_details_dto/raw_pokemon_species_details_dto.dart';
import 'package:pokemon_core/pokemon_core.dart';

class PokeApiClient {
  PokeApiClient(this.pokeDio);

  final PokeDio pokeDio;
  TaskEither<Failure, RawPokemonListDto> fetchRawPokemonList() {
    return TaskEither.tryCatch(() async {
      final response = await pokeDio.dio.get<RawPokemonListDto>('/pokemon');
      return response.data ?? RawPokemonListDto.empty();
    }, (error, stackTrace) => Failure.httpFailure());
  }

  TaskEither<Failure, RawPokemonDetailsDto> getPokemonDetails(String id) {
    return TaskEither.tryCatch(() async {
      final response = await pokeDio.dio.get<RawPokemonDetailsDto>(
        '/pokemon/$id',
      );
      return response.data ?? RawPokemonDetailsDto.empty();
    }, (error, stackTrace) => Failure.httpFailure());
  }

  TaskEither<Failure, RawPokemonSpeciesDetailsDto> getPokemonSpeciesDetails(
    String id,
  ) {
    return TaskEither.tryCatch(() async {
      final response = await pokeDio.dio.get<RawPokemonSpeciesDetailsDto>(
        '/pokemon-species/$id',
      );
      return response.data ?? RawPokemonSpeciesDetailsDto.empty();
    }, (error, stackTrace) => Failure.httpFailure());
  }
}
