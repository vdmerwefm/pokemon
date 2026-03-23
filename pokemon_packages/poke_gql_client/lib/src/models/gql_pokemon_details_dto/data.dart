import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:poke_gql_client/src/models/gql_pokemon_details_dto/pokemon.dart';
import 'package:poke_gql_client/src/models/gql_pokemon_details_dto/pokemonstat.dart';

part 'data.freezed.dart';
part 'data.g.dart';

@freezed
class Data with _$Data {
  factory Data({
    List<Pokemon>? pokemon,
    List<Pokemonstat>? pokemonstat,
  }) = _Data;

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);
}
