import 'package:pokemon_models/pokemon_models.dart';

class PokemonListHelper {
  static List<PokemonListTileModel> canLearnList(
    List<PokemonListTileModel> canLearnList,
  ) {
    final emptyRecords = (4 - canLearnList.length % 4) % 4;

    return [
      ...canLearnList,
      for (int emptyRecord = 0; emptyRecord < emptyRecords; emptyRecord++)
        PokemonListTileModel.empty(),
    ];
  }

  static List<PokemonListTileModel> favortiesList(
    List<int>? indexList,
    List<PokemonListTileModel> pokemonFavorites,
  ) {

    List<PokemonListTileModel> filteredList = [];

    if (indexList != null) {
      for (final index in indexList) {
        for (final pokemon in pokemonFavorites) {
          if (index == pokemon.id) {
            filteredList.add(pokemon);
          }
          if (!indexList.contains(pokemon.id)) {
            filteredList.remove(pokemon);
          }
        }
      }
    } else {
      filteredList = [];
    }

    filteredList.sort((pokemonA, pokemonB) => pokemonA.id.compareTo(pokemonB.id));

    return filteredList;
  }
}
