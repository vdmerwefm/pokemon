import 'package:freezed_annotation/freezed_annotation.dart';

import 'data.dart';

part 'gql_pokemon_moves_details_dto.freezed.dart';
part 'gql_pokemon_moves_details_dto.g.dart';

@freezed
class GqlPokemonMovesDetailsDto with _$GqlPokemonMovesDetailsDto {
  factory GqlPokemonMovesDetailsDto({
    Data? data,
  }) = _GqlPokemonMovesDetailsDto;

  factory GqlPokemonMovesDetailsDto.fromJson(Map<String, dynamic> json) =>
      _$GqlPokemonMovesDetailsDtoFromJson(json);
}
