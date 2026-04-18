import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:poke_gql_client/src/models/gql_pokemon_details_dto/pokemonforms.dart';

part 'pokemons.freezed.dart';
part 'pokemons.g.dart';

@freezed
class Pokemons with _$Pokemons {
  factory Pokemons({
    List<PokemonForms>? pokemonforms,
  }) = _Pokemons;

  factory Pokemons.fromJson(Map<String, dynamic> json) =>
      _$PokemonsFromJson(json);
}
