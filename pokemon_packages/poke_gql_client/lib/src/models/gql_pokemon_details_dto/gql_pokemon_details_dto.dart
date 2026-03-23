import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:poke_gql_client/src/models/gql_pokemon_details_dto/data.dart';

part 'gql_pokemon_details_dto.freezed.dart';
part 'gql_pokemon_details_dto.g.dart';

@freezed
class GqlPokemonDetailsDto with _$GqlPokemonDetailsDto {
  factory GqlPokemonDetailsDto({
    Data? data,
  }) = _GqlPokemonDetailsDto;

  factory GqlPokemonDetailsDto.fromJson(Map<String, dynamic> json) =>
      _$GqlPokemonDetailsDtoFromJson(json);

  factory GqlPokemonDetailsDto.empty() => GqlPokemonDetailsDto();
}
