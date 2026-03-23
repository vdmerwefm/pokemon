import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:poke_gql_client/src/models/gql_pokemon_details_dto/pokemonspeciesnames.dart';

part 'pokemon_evolutions.freezed.dart';
part 'pokemon_evolutions.g.dart';

@freezed
class PokemonEvolutions with _$PokemonEvolutions {
  factory PokemonEvolutions({
    Pokemonspeciesnames? pokemonspeciesnames,
  }) = _PokemonEvolutions;

  factory PokemonEvolutions.fromJson(Map<String, dynamic> json) =>
      _$PokemonEvolutionsFromJson(json);
}
