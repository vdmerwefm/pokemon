import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:poke_gql_client/src/models/gql_pokemon_move_details_dto/type.dart';

part 'pokemontype.freezed.dart';
part 'pokemontype.g.dart';

@freezed
class Pokemontype with _$Pokemontype {
  factory Pokemontype({
    Type? type,
  }) = _Pokemontype;

  factory Pokemontype.fromJson(Map<String, dynamic> json) =>
      _$PokemontypeFromJson(json);
}
