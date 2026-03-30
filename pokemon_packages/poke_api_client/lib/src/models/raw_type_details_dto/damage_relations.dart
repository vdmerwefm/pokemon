import 'package:freezed_annotation/freezed_annotation.dart';

import 'double_damage_from.dart';
import 'double_damage_to.dart';

part 'damage_relations.freezed.dart';
part 'damage_relations.g.dart';

@freezed
class DamageRelations with _$DamageRelations {
  factory DamageRelations({
    @JsonKey(name: 'double_damage_from')
    List<DoubleDamageFrom>? doubleDamageFrom,
    @JsonKey(name: 'double_damage_to') List<DoubleDamageTo>? doubleDamageTo,
  }) = _DamageRelations;

  factory DamageRelations.fromJson(Map<String, dynamic> json) =>
      _$DamageRelationsFromJson(json);
}
