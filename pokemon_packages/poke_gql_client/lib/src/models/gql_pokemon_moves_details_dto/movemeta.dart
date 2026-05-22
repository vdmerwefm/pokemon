import 'package:freezed_annotation/freezed_annotation.dart';

import 'movemetaailment.dart';

part 'movemeta.freezed.dart';
part 'movemeta.g.dart';

@freezed
class Movemeta with _$Movemeta {
  factory Movemeta({
    Movemetaailment? movemetaailment,
  }) = _Movemeta;

  factory Movemeta.fromJson(Map<String, dynamic> json) =>
      _$MovemetaFromJson(json);
}
