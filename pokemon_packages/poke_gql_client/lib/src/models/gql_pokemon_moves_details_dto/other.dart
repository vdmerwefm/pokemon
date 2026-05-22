import 'package:freezed_annotation/freezed_annotation.dart';

import 'official_artwork.dart';

part 'other.freezed.dart';
part 'other.g.dart';

@freezed
class Other with _$Other {
  factory Other({
    @JsonKey(name: 'official-artwork') OfficialArtwork? officialArtwork,
  }) = _Other;

  factory Other.fromJson(Map<String, dynamic> json) => _$OtherFromJson(json);
}
