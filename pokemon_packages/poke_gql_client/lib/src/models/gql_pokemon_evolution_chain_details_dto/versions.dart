import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:poke_gql_client/src/models/gql_pokemon_evolution_chain_details_dto/generation_v.dart';

part 'versions.freezed.dart';
part 'versions.g.dart';

@freezed
class Versions with _$Versions {
  factory Versions({
    @JsonKey(name: 'generation-v') GenerationV? generationV,
  }) = _Versions;

  factory Versions.fromJson(Map<String, dynamic> json) =>
      _$VersionsFromJson(json);
}
