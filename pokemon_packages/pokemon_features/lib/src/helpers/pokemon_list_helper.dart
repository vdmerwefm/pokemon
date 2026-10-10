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
}
