import 'package:freezed_annotation/freezed_annotation.dart';

part 'movemetaailment.freezed.dart';
part 'movemetaailment.g.dart';

@freezed
class Movemetaailment with _$Movemetaailment {
  factory Movemetaailment({
    String? name,
  }) = _Movemetaailment;

  factory Movemetaailment.fromJson(Map<String, dynamic> json) =>
      _$MovemetaailmentFromJson(json);
}
