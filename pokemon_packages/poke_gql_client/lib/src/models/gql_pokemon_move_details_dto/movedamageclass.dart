import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:poke_gql_client/src/models/gql_pokemon_move_details_dto/movedamageclassdescription.dart';

part 'movedamageclass.freezed.dart';
part 'movedamageclass.g.dart';

@freezed
class Movedamageclass with _$Movedamageclass {
  factory Movedamageclass({
    String? name,
    List<Movedamageclassdescription>? movedamageclassdescriptions,
  }) = _Movedamageclass;

  factory Movedamageclass.fromJson(Map<String, dynamic> json) =>
      _$MovedamageclassFromJson(json);
}
