import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:poke_gql_client/src/models/gql_pokemon_list_dto/data.dart';

part 'gql_pokemon_list_dto.freezed.dart';
part 'gql_pokemon_list_dto.g.dart';

@freezed
class GqlPokemonListDto with _$GqlPokemonListDto {
  factory GqlPokemonListDto({
    Data? data,
  }) = _GqlPokemonListDto;

  factory GqlPokemonListDto.fromJson(Map<String, dynamic> json) =>
      _$GqlPokemonListDtoFromJson(json);

  factory GqlPokemonListDto.empty() => GqlPokemonListDto();
}
