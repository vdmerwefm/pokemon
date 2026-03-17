import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:poke_gql_client/src/models/gql_pokemon_list_dto/pokemonspeciesname.dart';

part 'pokemonspecies.freezed.dart';
part 'pokemonspecies.g.dart';

@freezed
class PokemonSpecies with _$PokemonSpecies {
  factory PokemonSpecies({
    List<Pokemonspeciesname>? pokemonspeciesnames,
  }) = _PokemonSpecies;

  factory PokemonSpecies.fromJson(Map<String, dynamic> json) =>
      _$PokemonSpeciesFromJson(json);
}
