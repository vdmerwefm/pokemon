import 'package:poke_api_client/poke_api_client.dart';
import 'package:pokemon_models/pokemon_models.dart';
import 'package:pokemon_repositories/src/mappers/constants/pokemon_list_constants.dart';

extension PokemonListMapper on RawPokemonListDto {
  List<PokemonListModel> toPokemonList() {
    return results!
        .map(
          (rawPokemon) => PokemonListModel(
            name: rawPokemon.name ?? '',
            url: rawPokemon.url ?? '',
            icon:
                '$iconUrl${rawPokemon.url!.replaceFirst(pokeUrl, blank).replaceFirst('/', '')}.png',
          ),
        )
        .toList();
  }
}
