import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:poke_api_client/src/dtos/raw_pokemon_species_details_dto/language.dart';
import 'package:poke_api_client/src/dtos/raw_pokemon_species_details_dto/version.dart';

part 'flavor_text_entry.freezed.dart';
part 'flavor_text_entry.g.dart';

@freezed
class FlavorTextEntry with _$FlavorTextEntry {
  factory FlavorTextEntry({
    @JsonKey(name: 'flavor_text') String? flavorText,
    Language? language,
    Version? version,
  }) = _FlavorTextEntry;

  factory FlavorTextEntry.fromJson(Map<String, dynamic> json) =>
      _$FlavorTextEntryFromJson(json);

  factory FlavorTextEntry.empty() => FlavorTextEntry(
    flavorText: '',
    language: null,
    version: null,
  );
}
