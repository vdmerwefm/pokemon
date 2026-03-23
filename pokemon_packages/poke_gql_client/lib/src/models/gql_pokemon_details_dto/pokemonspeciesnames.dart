import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:poke_gql_client/src/models/gql_pokemon_details_dto/pokemonspecy.dart';

part 'pokemonspeciesnames.freezed.dart';
part 'pokemonspeciesnames.g.dart';

@freezed
class Pokemonspeciesnames with _$Pokemonspeciesnames {
  factory Pokemonspeciesnames({
    List<Pokemonspecy>? pokemonspecies,
  }) = _Pokemonspeciesnames;

  factory Pokemonspeciesnames.fromJson(Map<String, dynamic> json) =>
      _$PokemonspeciesnamesFromJson(json);
}
