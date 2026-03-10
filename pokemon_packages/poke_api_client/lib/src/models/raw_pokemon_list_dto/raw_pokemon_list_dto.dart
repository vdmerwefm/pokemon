import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:poke_api_client/src/models/raw_pokemon_list_dto/raw_pokemon.dart';

part 'raw_pokemon_list_dto.freezed.dart';
part 'raw_pokemon_list_dto.g.dart';

@freezed
abstract class RawPokemonListDto with _$RawPokemonListDto {
  factory RawPokemonListDto({
    int? count,
    String? next,
    dynamic previous,
    List<RawPokemonDto>? results,
  }) = _RawPokemonListDto;

  factory RawPokemonListDto.fromJson(Map<String, dynamic> json) =>
      _$RawPokemonListDtoFromJson(json);

  factory RawPokemonListDto.empty() => RawPokemonListDto(
    count: 0,
    next: '',
    results: [],
  );
}
