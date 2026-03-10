import 'package:freezed_annotation/freezed_annotation.dart';

part 'stat.freezed.dart';
part 'stat.g.dart';

@freezed
class Stat with _$Stat {
  factory Stat({
    @JsonKey(name: 'base_stat') int? baseStat,
    int? effort,
    Map<String, dynamic>? stat,
  }) = _Stat;

  factory Stat.fromJson(Map<String, dynamic> json) => _$StatFromJson(json);

  factory Stat.empty() => Stat(
    baseStat: 0,
    effort: 0,
    stat: null,
  );
}
