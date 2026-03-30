import 'package:freezed_annotation/freezed_annotation.dart';

import 'damage_relations.dart';

part 'raw_type_details_dto.freezed.dart';
part 'raw_type_details_dto.g.dart';

@freezed
class RawTypeDetailsDto with _$RawTypeDetailsDto {
  factory RawTypeDetailsDto({
    @JsonKey(name: 'damage_relations') DamageRelations? damageRelations,
  }) = _RawTypeDetailsDto;

  factory RawTypeDetailsDto.fromJson(Map<String, dynamic> json) =>
      _$RawTypeDetailsDtoFromJson(json);

  factory RawTypeDetailsDto.empty() =>
      RawTypeDetailsDto();
}
