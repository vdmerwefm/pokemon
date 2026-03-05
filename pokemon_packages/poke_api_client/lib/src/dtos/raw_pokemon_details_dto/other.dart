import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:poke_api_client/src/dtos/raw_pokemon_details_dto/dream_world.dart';


part 'other.freezed.dart';
part 'other.g.dart';

@freezed
class Other with _$Other {
  factory Other({
    @JsonKey(name: 'dream_world') DreamWorld? dreamWorld,
  }) = _Other;

  factory Other.fromJson(Map<String, dynamic> json) => _$OtherFromJson(json);
}
