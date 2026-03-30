import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:poke_gql_client/src/models/gql_pokemon_list_dto/sprites.dart';

part 'pokemonsprite.freezed.dart';
part 'pokemonsprite.g.dart';

@freezed
class Pokemonsprite with _$Pokemonsprite {
  factory Pokemonsprite({
    Sprites? sprites,
  }) = _Pokemonsprite;

  factory Pokemonsprite.fromJson(Map<String, dynamic> json) =>
      _$PokemonspriteFromJson(json);
}
