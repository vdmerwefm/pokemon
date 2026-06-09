import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:poke_gql_client/src/models/gql_pokemon_move_details_dto/moveeffecteffecttext.dart';

part 'moveeffect.freezed.dart';
part 'moveeffect.g.dart';

@freezed
class Moveeffect with _$Moveeffect {
  factory Moveeffect({
    List<Moveeffecteffecttext>? moveeffecteffecttexts,
  }) = _Moveeffect;

  factory Moveeffect.fromJson(Map<String, dynamic> json) =>
      _$MoveeffectFromJson(json);
}
