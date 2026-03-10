import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:poke_api_client/src/models/raw_pokemon_details_dto/icons.dart';

part 'generation_vii.freezed.dart';
part 'generation_vii.g.dart';

@freezed
class GenerationVii with _$GenerationVii {
  factory GenerationVii({
    Icons? icons,
  }) = _GenerationVii;

  factory GenerationVii.fromJson(Map<String, dynamic> json) =>
      _$GenerationViiFromJson(json);

  factory GenerationVii.empty() => GenerationVii(
    icons: null,
  );
}
