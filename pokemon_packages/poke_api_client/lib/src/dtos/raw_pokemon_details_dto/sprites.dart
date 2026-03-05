import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:poke_api_client/src/dtos/raw_pokemon_details_dto/other.dart';
import 'package:poke_api_client/src/dtos/raw_pokemon_details_dto/versions.dart';

part 'sprites.freezed.dart';
part 'sprites.g.dart';

@freezed
class Sprites with _$Sprites {
  factory Sprites({
    @JsonKey(name: 'back_default') String? backDefault,
    @JsonKey(name: 'back_female') dynamic backFemale,
    @JsonKey(name: 'back_shiny') String? backShiny,
    @JsonKey(name: 'back_shiny_female') dynamic backShinyFemale,
    @JsonKey(name: 'front_default') String? frontDefault,
    @JsonKey(name: 'front_female') dynamic frontFemale,
    @JsonKey(name: 'front_shiny') String? frontShiny,
    @JsonKey(name: 'front_shiny_female') dynamic frontShinyFemale,
    Other? other,
    Versions? versions,
  }) = _Sprites;

  factory Sprites.fromJson(Map<String, dynamic> json) =>
      _$SpritesFromJson(json);
}
