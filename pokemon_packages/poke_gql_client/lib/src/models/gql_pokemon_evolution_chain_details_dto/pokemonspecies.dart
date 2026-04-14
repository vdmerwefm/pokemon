import 'package:freezed_annotation/freezed_annotation.dart';

part 'pokemonspecies.freezed.dart';
part 'pokemonspecies.g.dart';

@freezed
class PokemonSpecies with _$PokemonSpecies {
  factory PokemonSpecies({
    String? genus,
  }) = _PokemonSpecies;

  factory PokemonSpecies.fromJson(Map<String, dynamic> json) =>
      _$PokemonSpeciesFromJson(json);
}
