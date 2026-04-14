import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:poke_gql_client/src/models/gql_pokemon_evolution_chain_details_dto/pokemonspecy.dart';
import 'package:poke_gql_client/src/models/gql_pokemon_evolution_chain_details_dto/pokemonsprite.dart';
import 'package:poke_gql_client/src/models/gql_pokemon_evolution_chain_details_dto/pokemontype.dart';

part 'pokemon.freezed.dart';
part 'pokemon.g.dart';

@freezed
class Pokemon with _$Pokemon {
  factory Pokemon({
    int? id,
    String? name,
    List<Pokemonsprite>? pokemonsprites,
    List<Pokemontype>? pokemontypes,
    Pokemonspecy? pokemonspecy,
  }) = _Pokemon;

  factory Pokemon.fromJson(Map<String, dynamic> json) =>
      _$PokemonFromJson(json);
}
