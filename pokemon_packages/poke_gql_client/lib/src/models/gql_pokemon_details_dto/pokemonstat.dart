import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:poke_gql_client/src/models/gql_pokemon_details_dto/stat.dart';

part 'pokemonstat.freezed.dart';
part 'pokemonstat.g.dart';

@freezed
class Pokemonstat with _$Pokemonstat {
  factory Pokemonstat({
    Stat? stat,
    @JsonKey(name: 'base_stat') int? baseStat,
  }) = _Pokemonstat;

  factory Pokemonstat.fromJson(Map<String, dynamic> json) =>
      _$PokemonstatFromJson(json);
}
