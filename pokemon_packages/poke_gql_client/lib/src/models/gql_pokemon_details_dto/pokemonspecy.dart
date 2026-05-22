import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:poke_gql_client/src/models/gql_pokemon_details_dto/pokemons.dart';

part 'pokemonspecy.freezed.dart';
part 'pokemonspecy.g.dart';

@freezed
class Pokemonspecy with _$Pokemonspecy {
  factory Pokemonspecy({
    @JsonKey(name: 'flavor_text') String? flavorText,
    String? genus,
    String? name,
    List<Pokemons>? pokemons,
  }) = _Pokemonspecy;

  factory Pokemonspecy.fromJson(Map<String, dynamic> json) =>
      _$PokemonspecyFromJson(json);
}
