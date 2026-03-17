import 'package:freezed_annotation/freezed_annotation.dart';

part 'sprites.freezed.dart';
part 'sprites.g.dart';

@freezed
class Sprites with _$Sprites {
  factory Sprites({
    String? backShiny,
    dynamic backFemale,
    String? frontShiny,
    String? backDefault,
    dynamic frontFemale,
    String? frontDefault,
    dynamic backShinyFemale,
    dynamic frontShinyFemale,
  }) = _Sprites;

  factory Sprites.fromJson(Map<String, dynamic> json) =>
      _$SpritesFromJson(json);
}
