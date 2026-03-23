import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:poke_gql_client/src/models/gql_pokemon_details_dto/pokemon_evolutions.dart';
import 'package:poke_gql_client/src/models/gql_pokemon_details_dto/pokemon_flavor_text.dart';
import 'package:poke_gql_client/src/models/gql_pokemon_details_dto/pokemon_genus.dart';
import 'package:poke_gql_client/src/models/gql_pokemon_details_dto/pokemonability.dart';
import 'package:poke_gql_client/src/models/gql_pokemon_details_dto/pokemoncry.dart';
import 'package:poke_gql_client/src/models/gql_pokemon_details_dto/pokemonmove.dart';
import 'package:poke_gql_client/src/models/gql_pokemon_details_dto/pokemonsprite.dart';
import 'package:poke_gql_client/src/models/gql_pokemon_details_dto/pokemontype.dart';

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
    List<Pokemonability>? pokemonabilities,
    @JsonKey(name: 'pokemon_genus') PokemonGenus? pokemonGenus,
    @JsonKey(name: 'pokemon_flavor_text') PokemonFlavorText? pokemonFlavorText,
    @JsonKey(name: 'pokemon_evolutions') PokemonEvolutions? pokemonEvolutions,
    List<Pokemoncry>? pokemoncries,
    List<Pokemonmove>? pokemonmoves,
    List<Pokemonsprite>? pokemonsprites,
    List<Pokemontype>? pokemontypes,
  }) = _Pokemon;

  factory Pokemon.fromJson(Map<String, dynamic> json) =>
      _$PokemonFromJson(json);
}
