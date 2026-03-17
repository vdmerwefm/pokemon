import 'package:freezed_annotation/freezed_annotation.dart';

part 'pokemonsprite.freezed.dart';
part 'pokemonsprite.g.dart';

@freezed
class Pokemonsprite with _$Pokemonsprite {
  factory Pokemonsprite({
    Map<String, dynamic>? sprites,
  }) = _Pokemonsprite;

  factory Pokemonsprite.fromJson(Map<String, dynamic> json) =>
      _$PokemonspriteFromJson(json);
}
