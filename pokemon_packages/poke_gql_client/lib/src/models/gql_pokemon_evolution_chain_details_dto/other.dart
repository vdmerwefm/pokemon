import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:poke_gql_client/src/models/gql_pokemon_evolution_chain_details_dto/official_artwork.dart';

part 'other.freezed.dart';
part 'other.g.dart';

@freezed
class Other with _$Other {
  factory Other({
    OfficialArtwork? officialArtwork,
  }) = _Other;

  factory Other.fromJson(Map<String, dynamic> json) => _$OtherFromJson(json);
}
