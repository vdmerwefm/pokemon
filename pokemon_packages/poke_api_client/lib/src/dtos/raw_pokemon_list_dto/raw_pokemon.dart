import 'package:freezed_annotation/freezed_annotation.dart';

part 'raw_pokemon.freezed.dart';
part 'raw_pokemon.g.dart';

@freezed
abstract class RawPokemonDto with _$RawPokemonDto {
  factory RawPokemonDto({
    String? name,
    String? url,
  }) = _RawPokemonDto;

  factory RawPokemonDto.fromJson(Map<String, dynamic> json) =>
      _$RawPokemonDtoFromJson(json);

  factory RawPokemonDto.empty() => RawPokemonDto(
    name: '',
    url: '',
  );
}
