import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:poke_gql_client/src/models/gql_pokemon_list_dto/pokemon.dart';

part 'pokemonmove.freezed.dart';
part 'pokemonmove.g.dart';

@freezed
class Pokemonmove with _$Pokemonmove {
  factory Pokemonmove({
    List<Pokemon>? pokemon,
  }) = _Pokemonmove;

  factory Pokemonmove.fromJson(Map<String, dynamic> json) =>
      _$PokemonmoveFromJson(json);
}
