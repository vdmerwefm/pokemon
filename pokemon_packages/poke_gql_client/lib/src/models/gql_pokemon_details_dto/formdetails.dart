import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:poke_gql_client/src/models/gql_pokemon_details_dto/pokemon_genus.dart';
import 'package:poke_gql_client/src/models/gql_pokemon_evolution_chain_details_dto/pokemonsprite.dart';
import 'package:poke_gql_client/src/models/gql_pokemon_evolution_chain_details_dto/pokemontype.dart';

part 'formdetails.freezed.dart';
part 'formdetails.g.dart';

@freezed
class Formdetails with _$Formdetails {
  factory Formdetails({
    @JsonKey(name: 'pokemon_genus') PokemonGenus? pokemonGenus,
    List<Pokemontype>? pokemontypes,
    List<Pokemonsprite>? pokemonsprites,
  }) = _Formdetails;

  factory Formdetails.fromJson(Map<String, dynamic> json) =>
      _$FormdetailsFromJson(json);
}
