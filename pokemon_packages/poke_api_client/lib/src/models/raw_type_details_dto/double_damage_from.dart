import 'package:freezed_annotation/freezed_annotation.dart';

part 'double_damage_from.freezed.dart';
part 'double_damage_from.g.dart';

@freezed
class DoubleDamageFrom with _$DoubleDamageFrom {
  factory DoubleDamageFrom({
    String? name,
  }) = _DoubleDamageFrom;

  factory DoubleDamageFrom.fromJson(Map<String, dynamic> json) =>
      _$DoubleDamageFromFromJson(json);
}
