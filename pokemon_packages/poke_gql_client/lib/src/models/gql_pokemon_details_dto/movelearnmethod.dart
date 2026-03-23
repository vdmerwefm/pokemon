import 'package:freezed_annotation/freezed_annotation.dart';

part 'movelearnmethod.freezed.dart';
part 'movelearnmethod.g.dart';

@freezed
class Movelearnmethod with _$Movelearnmethod {
  factory Movelearnmethod({
    String? name,
  }) = _Movelearnmethod;

  factory Movelearnmethod.fromJson(Map<String, dynamic> json) =>
      _$MovelearnmethodFromJson(json);
}
