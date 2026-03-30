// Reponsible for fetching data and converting to raw dto
import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';
import 'package:poke_api_client/src/dio/poke_dio.dart';
import 'package:poke_api_client/src/models/raw_type_details_dto/raw_type_details_dto.dart';
import 'package:pokemon_core/pokemon_core.dart';

@Singleton()
class PokeApiClient {
  PokeApiClient(this.pokeDio);

  final PokeDio pokeDio;

  TaskEither<Failure, RawTypeDetailsDto>
  fetchTypeDetails({
    required String typeName,
  }) {
    return TaskEither.tryCatch(() async {
      final response = await pokeDio.dio.get<Map<String, dynamic>>(
        '/type/$typeName',
      );
      if (response.data == null) {
        return RawTypeDetailsDto.empty();
      } else {
        return RawTypeDetailsDto.fromJson(response.data!);
      }
    }, (error, stackTrace) => Failure.httpFailure());
  }
}
