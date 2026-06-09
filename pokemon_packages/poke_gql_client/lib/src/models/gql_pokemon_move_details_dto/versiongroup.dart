import 'package:freezed_annotation/freezed_annotation.dart';

part 'versiongroup.freezed.dart';
part 'versiongroup.g.dart';

@freezed
class Versiongroup with _$Versiongroup {
  factory Versiongroup({
    String? name,
  }) = _Versiongroup;

  factory Versiongroup.fromJson(Map<String, dynamic> json) =>
      _$VersiongroupFromJson(json);
}
