import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:poke_api_client/src/models/raw_pokemon_details_dto/generation_v.dart';
import 'package:poke_api_client/src/models/raw_pokemon_details_dto/generation_vii.dart';

part 'versions.freezed.dart';
part 'versions.g.dart';

@freezed
class Versions with _$Versions {
  factory Versions({
    @JsonKey(name: 'generation-v') GenerationV? generationV,
    @JsonKey(name: 'generation-vii') GenerationVii? generationVii,
  }) = _Versions;

  factory Versions.fromJson(Map<String, dynamic> json) =>
      _$VersionsFromJson(json);

  factory Versions.empty() => Versions(
    generationV: null,
    generationVii: null,
  );
}
