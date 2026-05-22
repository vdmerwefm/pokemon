import 'package:freezed_annotation/freezed_annotation.dart';

import 'pokemonsprite.dart';
import 'pokemontype.dart';

part 'pokemon.freezed.dart';
part 'pokemon.g.dart';

@freezed
class Pokemon with _$Pokemon {
  factory Pokemon({
    int? id,
    String? name,
    int? height,
    int? weight,
    @JsonKey(name: 'is_default') bool? isDefault,
    List<Pokemonsprite>? pokemonsprites,
    List<Pokemontype>? pokemontypes,
  }) = _Pokemon;

  factory Pokemon.fromJson(Map<String, dynamic> json) =>
      _$PokemonFromJson(json);
}
