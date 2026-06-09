import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:poke_gql_client/src/models/gql_pokemon_move_details_dto/data.dart';

part 'gql_pokemon_move_details_dto.freezed.dart';
part 'gql_pokemon_move_details_dto.g.dart';

@freezed
class GqlPokemonMoveDetailsDto with _$GqlPokemonMoveDetailsDto {
  factory GqlPokemonMoveDetailsDto({
    Data? data,
  }) = _GqlPokemonMoveDetailsDto;

  factory GqlPokemonMoveDetailsDto.fromJson(Map<String, dynamic> json) =>
      _$GqlPokemonMoveDetailsDtoFromJson(json);

  factory GqlPokemonMoveDetailsDto.empty() => GqlPokemonMoveDetailsDto();
}
