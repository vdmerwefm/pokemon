import 'package:pokemon_models/pokemon_models.dart';

class DamageIndeciesHelper {
  static List<String> strongAgainstHelper({
    required List<TypeDetailsModel> pokemonDamageIndecies,
  }) {
    final strengthsList = [
      ...pokemonDamageIndecies
          .map((damageIndex) => damageIndex.strongAgainst)
          .first,
      ...pokemonDamageIndecies
          .map((damageIndex) => damageIndex.strongAgainst)
          .last,
    ];

    return strengthsList;
  }

  static List<String> weakAgainstHelper({
    required List<TypeDetailsModel> pokemonDamageIndecies,
  }) {
    final weaknessesList = [
      ...pokemonDamageIndecies
          .map((damageIndex) => damageIndex.weakAgainst)
          .first,
      ...pokemonDamageIndecies
          .map((damageIndex) => damageIndex.weakAgainst)
          .last,
    ];
    return weaknessesList;
  }
}
