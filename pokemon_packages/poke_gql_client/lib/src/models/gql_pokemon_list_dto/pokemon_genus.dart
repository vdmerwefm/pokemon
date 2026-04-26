import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:poke_gql_client/src/models/gql_pokemon_list_dto/pokemonspecy.dart';

part 'pokemon_genus.freezed.dart';
part 'pokemon_genus.g.dart';

@freezed
class PokemonGenus with _$PokemonGenus {
  factory PokemonGenus({
    List<Pokemonspecy>? pokemonspecies,
  }) = _PokemonGenus;

  factory PokemonGenus.fromJson(Map<String, dynamic> json) =>
      _$PokemonGenusFromJson(json);
}
