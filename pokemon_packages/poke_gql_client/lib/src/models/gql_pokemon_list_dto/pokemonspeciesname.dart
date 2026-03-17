import 'package:freezed_annotation/freezed_annotation.dart';

part 'pokemonspeciesname.freezed.dart';
part 'pokemonspeciesname.g.dart';

@freezed
class Pokemonspeciesname with _$Pokemonspeciesname {
  factory Pokemonspeciesname({
    String? genus,
  }) = _Pokemonspeciesname;

  factory Pokemonspeciesname.fromJson(Map<String, dynamic> json) =>
      _$PokemonspeciesnameFromJson(json);
}
