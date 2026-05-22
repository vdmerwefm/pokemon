import 'package:freezed_annotation/freezed_annotation.dart';

import 'pokemon.dart';

part 'pokemonmove.freezed.dart';
part 'pokemonmove.g.dart';

@freezed
class Pokemonmove with _$Pokemonmove {
  factory Pokemonmove({
    Pokemon? pokemon,
  }) = _Pokemonmove;

  factory Pokemonmove.fromJson(Map<String, dynamic> json) =>
      _$PokemonmoveFromJson(json);
}
