import 'package:freezed_annotation/freezed_annotation.dart';
part 'sprites.freezed.dart';
part 'sprites.g.dart';

@freezed
class Sprites with _$Sprites {
  factory Sprites({
    Map<String, dynamic>? other,
  }) = _Sprites;

  factory Sprites.fromJson(Map<String, dynamic> json) =>
      _$SpritesFromJson(json);
}
