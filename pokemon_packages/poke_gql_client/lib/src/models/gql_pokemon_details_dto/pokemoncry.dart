import 'package:freezed_annotation/freezed_annotation.dart';

part 'pokemoncry.freezed.dart';
part 'pokemoncry.g.dart';

@freezed
class Pokemoncry with _$Pokemoncry {
  factory Pokemoncry({
    Map<String, dynamic>? cries,
  }) = _Pokemoncry;

  factory Pokemoncry.fromJson(Map<String, dynamic> json) =>
      _$PokemoncryFromJson(json);
}
