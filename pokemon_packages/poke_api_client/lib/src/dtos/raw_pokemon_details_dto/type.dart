import 'package:freezed_annotation/freezed_annotation.dart';

part 'type.freezed.dart';
part 'type.g.dart';

@freezed
class Type with _$Type {
  factory Type({
    int? slot,
    Type? type,
  }) = _Type;

  factory Type.fromJson(Map<String, dynamic> json) => _$TypeFromJson(json);
}
