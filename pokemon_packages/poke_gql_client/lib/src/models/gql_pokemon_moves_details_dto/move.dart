import 'package:freezed_annotation/freezed_annotation.dart';

import 'movedamageclass.dart';
import 'moveeffect.dart';
import 'moveflavortext.dart';
import 'movemeta.dart';
import 'pokemonmove.dart';
import 'type.dart';

part 'move.freezed.dart';
part 'move.g.dart';

@freezed
class Move with _$Move {
  factory Move({
    int? id,
    String? name,
    Type? type,
    List<Moveflavortext>? moveflavortexts,
    dynamic power,
    int? accuracy,
    int? pp,
    Movedamageclass? movedamageclass,
    List<Movemeta>? movemeta,
    Moveeffect? moveeffect,
    List<dynamic>? machines,
    List<Pokemonmove>? pokemonmoves,
  }) = _Move;

  factory Move.fromJson(Map<String, dynamic> json) => _$MoveFromJson(json);
}
