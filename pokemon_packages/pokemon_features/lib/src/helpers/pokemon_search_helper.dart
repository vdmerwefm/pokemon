//these need to dynamically update to allow search
// ignore_for_file: prefer_final_locals, omit_local_variable_types

import 'package:pokemon_models/pokemon_models.dart';

class PokemonSearchHelper {
  static List<PokemonListTileModel>? pokemonSearchHelper({
    required List<PokemonListTileModel> pokemonSearchList,
    String? searchString,
  }) {
    List<PokemonListTileModel> filteredList = [];

    if (searchString != null || searchString != '') {
      for (final x in pokemonSearchList) {
        bool nameSearch = x.name.startsWith((searchString ?? '').toLowerCase());

        bool typeSearch = x.type
            .map((type) => type.startsWith((searchString ?? '').toLowerCase()))
            .any((e) => e == true);

        bool idSearch = x.id.toString() == searchString;

        if (nameSearch || typeSearch || idSearch) {
          filteredList.add(x);
        } else {
          filteredList.remove(x);
        }
      }
    }

    if (filteredList.isNotEmpty && filteredList != <PokemonListTileModel>[]) {
      return filteredList.toSet().toList();
    } else {
      return null;
    }
  }

  static List<PokemonMovesListModel>? moveSearchHelper({
    required List<PokemonMovesListModel> pokemonSearchList,
    String? searchString,
  }) {
    List<PokemonMovesListModel> filteredList = [];

    if (searchString != null || searchString != '') {
      for (final x in pokemonSearchList) {
        bool nameSearch = x.name!.startsWith(
          (searchString ?? '').toLowerCase(),
        );

        bool typeSearch = x.type!.startsWith(
          (searchString ?? '').toLowerCase(),
        );

        bool idSearch = x.id.toString() == searchString;

        if (nameSearch || typeSearch || idSearch) {
          filteredList.add(x);
        } else {
          filteredList.remove(x);
        }
      }
    }

    if (filteredList.isNotEmpty && filteredList != <PokemonMovesListModel>[]) {
      return filteredList.toSet().toList();
    } else {
      return null;
    }
  }
}
