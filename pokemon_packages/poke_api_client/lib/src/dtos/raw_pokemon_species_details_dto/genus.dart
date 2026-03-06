import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:poke_api_client/src/dtos/raw_pokemon_species_details_dto/language.dart';

part 'genus.freezed.dart';
part 'genus.g.dart';

@freezed
class Genus with _$Genus {
  factory Genus({
    String? genus,
    Language? language,
  }) = _Genus;

  factory Genus.fromJson(Map<String, dynamic> json) => _$GenusFromJson(json);

  factory Genus.empty() => Genus(
    genus: '',
    language: null,
  );
}
