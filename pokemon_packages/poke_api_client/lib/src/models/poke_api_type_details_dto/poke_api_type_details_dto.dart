import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:poke_api_client/src/models/poke_api_type_details_dto/damage_relations.dart';

part 'poke_api_type_details_dto.freezed.dart';
part 'poke_api_type_details_dto.g.dart';

@freezed
class PokeApiTypeDetailsDto with _$PokeApiTypeDetailsDto {
  factory PokeApiTypeDetailsDto({
    @JsonKey(name: 'damage_relations') DamageRelations? damageRelations,
  }) = _RawTypeDetailsDto;

  factory PokeApiTypeDetailsDto.fromJson(Map<String, dynamic> json) =>
      _$PokeApiTypeDetailsDtoFromJson(json);

  factory PokeApiTypeDetailsDto.empty() => PokeApiTypeDetailsDto();
}
