import 'package:freezed_annotation/freezed_annotation.dart';

part 'moveflavortext.freezed.dart';
part 'moveflavortext.g.dart';

@freezed
class Moveflavortext with _$Moveflavortext {
  factory Moveflavortext({
    @JsonKey(name: 'flavor_text') String? flavorText,
  }) = _Moveflavortext;

  factory Moveflavortext.fromJson(Map<String, dynamic> json) =>
      _$MoveflavortextFromJson(json);
}
