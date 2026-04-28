import 'package:freezed_annotation/freezed_annotation.dart';

import 'movedamageclass.dart';
import 'pokemonmove.dart';
import 'type.dart';

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
    List<Pokemonmove>? pokemonmoves,
  }) = _Move;

  factory Move.fromJson(Map<String, dynamic> json) => _$MoveFromJson(json);
}
