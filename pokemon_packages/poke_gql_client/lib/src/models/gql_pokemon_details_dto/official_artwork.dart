import 'package:freezed_annotation/freezed_annotation.dart';

part 'official_artwork.freezed.dart';
part 'official_artwork.g.dart';

@freezed
class OfficialArtwork with _$OfficialArtwork {
  factory OfficialArtwork({
    @JsonKey(name: 'front_shiny') String? frontShiny,
    @JsonKey(name: 'front_default') String? frontDefault,
  }) = _OfficialArtwork;

  factory OfficialArtwork.fromJson(Map<String, dynamic> json) =>
      _$OfficialArtworkFromJson(json);
}
