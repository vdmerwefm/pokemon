import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:poke_gql_client/src/models/gql_pokemon_details_dto/black_white.dart';

part 'generation_v.freezed.dart';
part 'generation_v.g.dart';

@freezed
class GenerationV with _$GenerationV {
  factory GenerationV({
    @JsonKey(name: 'black-white') BlackWhite? blackWhite,
  }) = _GenerationV;

  factory GenerationV.fromJson(Map<String, dynamic> json) =>
      _$GenerationVFromJson(json);
}
