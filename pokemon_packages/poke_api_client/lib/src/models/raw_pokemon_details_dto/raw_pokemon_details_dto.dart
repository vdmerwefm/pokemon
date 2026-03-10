import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:poke_api_client/src/models/raw_pokemon_details_dto/ability.dart';
import 'package:poke_api_client/src/models/raw_pokemon_details_dto/cries.dart';
import 'package:poke_api_client/src/models/raw_pokemon_details_dto/species.dart';
import 'package:poke_api_client/src/models/raw_pokemon_details_dto/sprites.dart';
import 'package:poke_api_client/src/models/raw_pokemon_details_dto/stat.dart';
import 'package:poke_api_client/src/models/raw_pokemon_details_dto/type.dart';

part 'raw_pokemon_details_dto.freezed.dart';
part 'raw_pokemon_details_dto.g.dart';

@freezed
class RawPokemonDetailsDto with _$RawPokemonDetailsDto {
  factory RawPokemonDetailsDto({
    List<Ability>? abilities,
    Cries? cries,
    int? height,
    int? id,
    @JsonKey(name: 'is_default') bool? isDefault,
    String? name,
    Species? species,
    Sprites? sprites,
    List<Stat>? stats,
    List<Type>? types,
    int? weight,
  }) = _RawPokemonDetailsDto;

  factory RawPokemonDetailsDto.fromJson(Map<String, dynamic> json) =>
      _$RawPokemonDetailsDtoFromJson(json);

  factory RawPokemonDetailsDto.empty() => RawPokemonDetailsDto(
    abilities: null,
    cries: null,
    height: null,
    id: null,
    isDefault: null,
    name: null,
    species: null,
    sprites: null,
    stats: null,
    types: null,
    weight: null,
  );
}
