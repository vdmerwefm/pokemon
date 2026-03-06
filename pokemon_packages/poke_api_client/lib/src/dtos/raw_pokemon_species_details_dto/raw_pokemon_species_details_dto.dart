import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:poke_api_client/src/dtos/raw_pokemon_species_details_dto/flavor_text_entry.dart';
import 'package:poke_api_client/src/dtos/raw_pokemon_species_details_dto/genus.dart';

part 'raw_pokemon_species_details_dto.freezed.dart';
part 'raw_pokemon_species_details_dto.g.dart';

@freezed
class RawPokemonSpeciesDetailsDto with _$RawPokemonSpeciesDetailsDto {
  factory RawPokemonSpeciesDetailsDto({
    @JsonKey(name: 'flavor_text_entries')
    List<FlavorTextEntry>? flavorTextEntries,
    List<Genus>? genera,
    @JsonKey(name: 'is_baby') bool? isBaby,
    @JsonKey(name: 'is_legendary') bool? isLegendary,
    @JsonKey(name: 'is_mythical') bool? isMythical,
  }) = _RawPokemonSpeciesDetailsDto;

  factory RawPokemonSpeciesDetailsDto.fromJson(Map<String, dynamic> json) =>
      _$RawPokemonSpeciesDetailsDtoFromJson(json);

  factory RawPokemonSpeciesDetailsDto.empty() => RawPokemonSpeciesDetailsDto(
    flavorTextEntries: null,
    genera: null, 
    isBaby: false,
    isLegendary: false,
    isMythical: false,
  );
}
