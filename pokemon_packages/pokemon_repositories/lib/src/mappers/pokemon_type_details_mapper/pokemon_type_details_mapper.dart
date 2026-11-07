import 'package:poke_api_client/poke_api_client.dart';
import 'package:pokemon_models/pokemon_models.dart';

extension PokemonTypeDetailsMapper on PokeApiTypeDetailsDto {
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

    final moveWeaknesses = _moveWeaknesses(
      halfDamageTo: damageRelations?.halfDamageTo ?? [],
      noDamageTo: damageRelations?.onDamageTo ?? [],
    ) ?? [];

    return PokemonTypeDetailsModel(
      strongAgainst: strengths,
      weakAgainst: weaknesses,
      moveWeakAgainst: moveWeaknesses,
    );
  }

  List<String>? _moveWeaknesses({
    required List<HalfDamageTo>? halfDamageTo,
    required List<NoDamageTo>? noDamageTo,
  }) {
    final halfDamageToList = halfDamageTo?.map(
      (halfDamageTo) => halfDamageTo.name ?? '',
    ) ?? [];
    final noDamageToList = noDamageTo?.map(
      (noDamageTo) => noDamageTo.name ?? '',
    ) ?? [];
    return [...noDamageToList, ...halfDamageToList];
  }
}
