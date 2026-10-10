import 'package:freezed_annotation/freezed_annotation.dart';

part 'double_damage_to.freezed.dart';
part 'double_damage_to.g.dart';

@freezed
class DoubleDamageTo with _$DoubleDamageTo {
  factory DoubleDamageTo({
    String? name,
  }) = _DoubleDamageTo;

  factory DoubleDamageTo.fromJson(Map<String, dynamic> json) =>
      _$DoubleDamageToFromJson(json);
}
