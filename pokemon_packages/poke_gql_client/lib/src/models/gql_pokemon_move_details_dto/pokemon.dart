import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:poke_gql_client/src/models/gql_pokemon_move_details_dto/pokemon_genus.dart';
import 'package:poke_gql_client/src/models/gql_pokemon_move_details_dto/pokemonsprite.dart';
import 'package:poke_gql_client/src/models/gql_pokemon_move_details_dto/pokemontype.dart';

part 'pokemon.freezed.dart';
part 'pokemon.g.dart';

@freezed
class Pokemon with _$Pokemon {
  factory Pokemon({
    int? id,
    String? name,
    int? height,
    int? weight,
    @JsonKey(name: 'is_default') bool? isDefault,
    List<Pokemonsprite>? pokemonsprites,
    List<Pokemontype>? pokemontypes,
    @JsonKey(name: 'pokemon_genus') PokemonGenus? pokemonGenus,
  }) = _Pokemon;

  factory Pokemon.fromJson(Map<String, dynamic> json) =>
      _$PokemonFromJson(json);
}
