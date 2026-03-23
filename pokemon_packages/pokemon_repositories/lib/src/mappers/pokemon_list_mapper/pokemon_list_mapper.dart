import 'package:poke_gql_client/poke_gql_client.dart';
import 'package:pokemon_models/pokemon_models.dart';

extension PokemonListMapper on GqlPokemonListDto {
  List<PokemonListModel> toPokemonList() {
    return data!.pokemon!.map(
      (rawPokemon) {
        return PokemonListModel(
          name: rawPokemon.name ?? '',
          sprite:
              (rawPokemon
                          .pokemonsprites
                          ?.firstOrNull
                          ?.sprites
                          ?.other?['official-artwork']
                      as Map<String, dynamic>?)?['front_default']
                  as String? ??
              '',
          id: rawPokemon.id ?? 0,
          type: rawPokemon.pokemontypes!
              .map((type) => type.type?.name ?? '')
              .toList(),
          genus:
              rawPokemon.pokemonspecy?.pokemonspecies?.firstOrNull?.genus ?? '',
        );
      },
    ).toList();
  }
}
