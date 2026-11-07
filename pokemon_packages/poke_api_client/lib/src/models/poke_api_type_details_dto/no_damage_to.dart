import 'package:freezed_annotation/freezed_annotation.dart';

part 'no_damage_to.freezed.dart';
part 'no_damage_to.g.dart';

@freezed
class NoDamageTo with _$NoDamageTo {
  factory NoDamageTo({
    String? name,
  }) = _NoDamageTo;

  factory NoDamageTo.fromJson(Map<String, dynamic> json) =>
      _$NoDamageToFromJson(json);
}
