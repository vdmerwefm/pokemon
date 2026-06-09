import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:poke_gql_client/src/models/gql_pokemon_move_details_dto/machine.dart';
import 'package:poke_gql_client/src/models/gql_pokemon_move_details_dto/movedamageclass.dart';
import 'package:poke_gql_client/src/models/gql_pokemon_move_details_dto/moveeffect.dart';
import 'package:poke_gql_client/src/models/gql_pokemon_move_details_dto/moveflavortext.dart';
import 'package:poke_gql_client/src/models/gql_pokemon_move_details_dto/movemeta.dart';
import 'package:poke_gql_client/src/models/gql_pokemon_move_details_dto/pokemonmove.dart';
import 'package:poke_gql_client/src/models/gql_pokemon_move_details_dto/type.dart';

part 'move.freezed.dart';
part 'move.g.dart';

@freezed
class Move with _$Move {
  factory Move({
    int? id,
    String? name,
    Type? type,
    List<Moveflavortext>? moveflavortexts,
    int? power,
    int? accuracy,
    int? pp,
    Movedamageclass? movedamageclass,
    List<Movemeta>? movemeta,
    Moveeffect? moveeffect,
    List<Machine>? machines,
    List<Pokemonmove>? pokemonmoves,
  }) = _Move;

  factory Move.fromJson(Map<String, dynamic> json) => _$MoveFromJson(json);
}
