import 'package:freezed_annotation/freezed_annotation.dart';

part 'moveeffecteffecttext.freezed.dart';
part 'moveeffecteffecttext.g.dart';

@freezed
class Moveeffecteffecttext with _$Moveeffecteffecttext {
  factory Moveeffecteffecttext({
    @JsonKey(name: 'short_effect') String? shortEffect,
  }) = _Moveeffecteffecttext;

  factory Moveeffecteffecttext.fromJson(Map<String, dynamic> json) =>
      _$MoveeffecteffecttextFromJson(json);
}
