import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:poke_gql_client/src/models/gql_pokemon_list_dto/pokemonspecies.dart';

part 'pokemonspecy.freezed.dart';
part 'pokemonspecy.g.dart';

@freezed
class Pokemonspecy with _$Pokemonspecy {
  factory Pokemonspecy({
    List<Pokemonspecy>? pokemonspecy,
    List<PokemonSpecies>? pokemonspecies,
  }) = _Pokemonspecy;

  factory Pokemonspecy.fromJson(Map<String, dynamic> json) =>
      _$PokemonspecyFromJson(json);
}
