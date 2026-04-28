import 'package:freezed_annotation/freezed_annotation.dart';

import 'data.dart';

part 'gql_pokemon_moves_dto.freezed.dart';
part 'gql_pokemon_moves_dto.g.dart';

@freezed
class GqlPokemonMovesDto with _$GqlPokemonMovesDto {
  factory GqlPokemonMovesDto({
    Data? data,
  }) = _GqlPokemonMovesDto;

  factory GqlPokemonMovesDto.fromJson(Map<String, dynamic> json) =>
      _$GqlPokemonMovesDtoFromJson(json);

  factory GqlPokemonMovesDto.empty() => GqlPokemonMovesDto();
}
