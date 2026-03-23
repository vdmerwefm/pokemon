import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:poke_gql_client/src/models/gql_pokemon_details_dto/ability.dart';

part 'pokemonability.freezed.dart';
part 'pokemonability.g.dart';

@freezed
class Pokemonability with _$Pokemonability {
  factory Pokemonability({
    Ability? ability,
  }) = _Pokemonability;

  factory Pokemonability.fromJson(Map<String, dynamic> json) =>
      _$PokemonabilityFromJson(json);
}
