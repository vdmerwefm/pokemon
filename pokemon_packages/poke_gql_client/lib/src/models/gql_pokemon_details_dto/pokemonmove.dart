import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:poke_gql_client/src/models/gql_pokemon_details_dto/move.dart';
import 'package:poke_gql_client/src/models/gql_pokemon_details_dto/movelearnmethod.dart';

part 'pokemonmove.freezed.dart';
part 'pokemonmove.g.dart';

@freezed
class Pokemonmove with _$Pokemonmove {
  factory Pokemonmove({
    int? level,
    Move? move,
    Movelearnmethod? movelearnmethod,
  }) = _Pokemonmove;

  factory Pokemonmove.fromJson(Map<String, dynamic> json) =>
      _$PokemonmoveFromJson(json);
}
