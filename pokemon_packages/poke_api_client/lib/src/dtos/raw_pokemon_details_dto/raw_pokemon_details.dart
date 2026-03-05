import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:poke_api_client/src/dtos/raw_pokemon_details_dto/ability.dart';
import 'package:poke_api_client/src/dtos/raw_pokemon_details_dto/cries.dart';
import 'package:poke_api_client/src/dtos/raw_pokemon_details_dto/held_item.dart';
import 'package:poke_api_client/src/dtos/raw_pokemon_details_dto/move.dart';
import 'package:poke_api_client/src/dtos/raw_pokemon_details_dto/species.dart';
import 'package:poke_api_client/src/dtos/raw_pokemon_details_dto/sprites.dart';
import 'package:poke_api_client/src/dtos/raw_pokemon_details_dto/stat.dart';
import 'package:poke_api_client/src/dtos/raw_pokemon_details_dto/type.dart';

part 'raw_pokemon_details.freezed.dart';
part 'raw_pokemon_details.g.dart';

@freezed
class RawPokemonDetails with _$RawPokemonDetails {
  factory RawPokemonDetails({
    List<Ability>? abilities,
    @JsonKey(name: 'base_experience') int? baseExperience,
    Cries? cries,
    int? height,
    @JsonKey(name: 'held_items') List<HeldItem>? heldItems,
    int? id,
    @JsonKey(name: 'is_default') bool? isDefault,
    @JsonKey(name: 'location_area_encounters') String? locationAreaEncounters,
    List<Move>? moves,
    String? name,
    int? order,
    @JsonKey(name: 'past_types') List<dynamic>? pastTypes,
    Species? species,
    Sprites? sprites,
    List<Stat>? stats,
    List<Type>? types,
    int? weight,
  }) = _RawPokemonDetails;

  factory RawPokemonDetails.fromJson(Map<String, dynamic> json) =>
      _$RawPokemonDetailsFromJson(json);
}
