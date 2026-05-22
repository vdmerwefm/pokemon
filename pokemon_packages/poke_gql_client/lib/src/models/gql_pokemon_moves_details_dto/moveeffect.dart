import 'package:freezed_annotation/freezed_annotation.dart';

import 'moveeffecteffecttext.dart';

part 'moveeffect.freezed.dart';
part 'moveeffect.g.dart';

@freezed
class Moveeffect with _$Moveeffect {
  factory Moveeffect({
    List<Moveeffecteffecttext>? moveeffecteffecttexts,
  }) = _Moveeffect;

  factory Moveeffect.fromJson(Map<String, dynamic> json) =>
      _$MoveeffectFromJson(json);
}
