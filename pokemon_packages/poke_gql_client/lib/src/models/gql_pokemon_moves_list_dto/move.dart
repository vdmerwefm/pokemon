import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:poke_gql_client/src/models/gql_pokemon_moves_list_dto/movedamageclass.dart';
import 'package:poke_gql_client/src/models/gql_pokemon_moves_list_dto/type.dart';

part 'move.freezed.dart';
part 'move.g.dart';

@freezed
class Move with _$Move {
  factory Move({
    String? name,
    Type? type,
    int? power,
    int? accuracy,
    Movedamageclass? movedamageclass,
  }) = _Move;

  factory Move.fromJson(Map<String, dynamic> json) => _$MoveFromJson(json);
}
