import 'package:freezed_annotation/freezed_annotation.dart';

part 'version_group.freezed.dart';
part 'version_group.g.dart';

@freezed
class VersionGroup with _$VersionGroup {
  factory VersionGroup({
    String? name,
    String? url,
  }) = _VersionGroup;

  factory VersionGroup.fromJson(Map<String, dynamic> json) =>
      _$VersionGroupFromJson(json);
}
