import 'package:poke_gql_client/poke_gql_client.dart';
import 'package:pokemon_models/pokemon_models.dart';

extension PokemonListMapper on GqlPokemonListDto {
  List<PokemonListModel> toPokemonList() {
    return data!.pokemon!
        .map(
          (rawPokemon) {

            final typeList = <String>[] ;
            for(final type in rawPokemon.pokemontypes!) {
              typeList.add(type.type?['name'] as String);
            }

            String? frontDefault;
            for(final sprite in rawPokemon.pokemonsprites!){
              if(sprite.sprites?['front_default'] != null){
                frontDefault = sprite.sprites?['front_default'] as String;
              } else {
                frontDefault = '';
              }
            }
            return PokemonListModel(
            name: rawPokemon.name ?? '',
            sprite: frontDefault ?? '',
            id: rawPokemon.id ?? 0,
            type: typeList,
          );
          },
        )
        .toList();
  }
}
