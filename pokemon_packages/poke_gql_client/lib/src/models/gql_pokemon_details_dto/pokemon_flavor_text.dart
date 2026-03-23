import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:poke_gql_client/src/models/gql_pokemon_details_dto/pokemonspecy.dart';

part 'pokemon_flavor_text.freezed.dart';
part 'pokemon_flavor_text.g.dart';

@freezed
class PokemonFlavorText with _$PokemonFlavorText {
  factory PokemonFlavorText({
    List<Pokemonspecy>? pokemonspecies,
  }) = _PokemonFlavorText;

  factory PokemonFlavorText.fromJson(Map<String, dynamic> json) =>
      _$PokemonFlavorTextFromJson(json);
}
