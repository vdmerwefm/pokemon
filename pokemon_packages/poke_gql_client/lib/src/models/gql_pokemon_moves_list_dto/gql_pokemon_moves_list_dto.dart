import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:poke_gql_client/src/models/gql_pokemon_moves_list_dto/data.dart';

part 'gql_pokemon_moves_list_dto.freezed.dart';
part 'gql_pokemon_moves_list_dto.g.dart';

@freezed
class GqlPokemonMovesListDto with _$GqlPokemonMovesListDto {
  factory GqlPokemonMovesListDto({
    Data? data,
  }) = _GqlPokemonMovesListDto;

  factory GqlPokemonMovesListDto.fromJson(Map<String, dynamic> json) =>
      _$GqlPokemonMovesListDtoFromJson(json);

  factory GqlPokemonMovesListDto.empty() => GqlPokemonMovesListDto();
}
