import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:poke_api_client/src/dtos/raw_pokemon_details_dto/animated.dart';

part 'black_white.freezed.dart';
part 'black_white.g.dart';

@freezed
class BlackWhite with _$BlackWhite {
  factory BlackWhite({
    Animated? animated,
  }) = _BlackWhite;

  factory BlackWhite.fromJson(Map<String, dynamic> json) =>
      _$BlackWhiteFromJson(json);

  factory BlackWhite.empty() => BlackWhite(
    animated: null,
  );
}
