import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:poke_gql_client/src/models/gql_pokemon_list_dto/pokemonsprite.dart';
import 'package:poke_gql_client/src/models/gql_pokemon_list_dto/pokemontype.dart';

part 'pokemon.freezed.dart';
part 'pokemon.g.dart';

@freezed
class Pokemon with _$Pokemon {
  factory Pokemon({
    int? id,
    String? name,
    List<Pokemontype>? pokemontypes,
    List<Pokemonsprite>? pokemonsprites,
  }) = _Pokemon;

  factory Pokemon.fromJson(Map<String, dynamic> json) =>
      _$PokemonFromJson(json);
}
