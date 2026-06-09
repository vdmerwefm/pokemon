import 'package:freezed_annotation/freezed_annotation.dart';

part 'pokemonspecy.freezed.dart';
part 'pokemonspecy.g.dart';

@freezed
class Pokemonspecy with _$Pokemonspecy {
  factory Pokemonspecy({
    String? genus,
  }) = _Pokemonspecy;

  factory Pokemonspecy.fromJson(Map<String, dynamic> json) =>
      _$PokemonspecyFromJson(json);
}
