import 'package:poke_api_client/poke_api_client.dart';
import 'package:pokemon_models/pokemon_models.dart';

extension TypeDetailsMapper on PokeApiTypeDetailsDto {
  PokemonTypeDetailsModel toTypeDetailsModel() {
    final strengths =
        damageRelations?.doubleDamageTo
            ?.map((strongAgainst) => strongAgainst.name ?? '')
            .toList() ??
        [];
    final weaknesses =
        damageRelations?.doubleDamageFrom
            ?.map((weakAgainst) => weakAgainst.name ?? '')
            .toList() ??
        [];

    return PokemonTypeDetailsModel(
      strongAgainst: strengths,
      weakAgainst: weaknesses,
    );
  }
}
