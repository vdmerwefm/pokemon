import 'package:freezed_annotation/freezed_annotation.dart';

part 'half_damage_to.freezed.dart';
part 'half_damage_to.g.dart';

@freezed
class HalfDamageTo with _$HalfDamageTo {
  factory HalfDamageTo({String? name}) = _HalfDamageTo;

  factory HalfDamageTo.fromJson(Map<String, dynamic> json) =>
      _$HalfDamageToFromJson(json);
}
