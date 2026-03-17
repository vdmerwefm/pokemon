import 'package:freezed_annotation/freezed_annotation.dart';

part 'pokemontype.freezed.dart';
part 'pokemontype.g.dart';

@freezed
class Pokemontype with _$Pokemontype {
  factory Pokemontype({
    Map<String, dynamic>? type,
  }) = _Pokemontype;

  factory Pokemontype.fromJson(Map<String, dynamic> json) =>
      _$PokemontypeFromJson(json);
}
