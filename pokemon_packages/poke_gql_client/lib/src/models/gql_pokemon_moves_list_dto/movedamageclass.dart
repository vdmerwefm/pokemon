import 'package:freezed_annotation/freezed_annotation.dart';

part 'movedamageclass.freezed.dart';
part 'movedamageclass.g.dart';

@freezed
class Movedamageclass with _$Movedamageclass {
  factory Movedamageclass({
    String? name,
  }) = _Movedamageclass;

  factory Movedamageclass.fromJson(Map<String, dynamic> json) =>
      _$MovedamageclassFromJson(json);
}
