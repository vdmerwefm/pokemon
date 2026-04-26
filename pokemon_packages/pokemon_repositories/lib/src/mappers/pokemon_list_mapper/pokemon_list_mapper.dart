import 'package:poke_gql_client/poke_gql_client.dart';
import 'package:pokemon_models/pokemon_models.dart';

extension PokemonListMapper on GqlPokemonListDto {
  List<PokemonListTileModel> toPokemonList() {
    return data!.pokemon!.map(
      (rawPokemon) {
        final pokemonName = rawPokemon.name;

        final pokemonSprite =
            (rawPokemon
                        .pokemonsprites
                        ?.firstOrNull
                        ?.sprites
                        ?.other?['official-artwork']
                    as Map<String, dynamic>?)?['front_default']
                as String?;

        final pokemonId = rawPokemon.id;

        final pokemonTypes = rawPokemon.pokemontypes
            ?.map((type) => type.type?.name ?? '')
            .toSet()
            .toList();

        final pokemonGenus = rawPokemon.pokemonGenus?.pokemonspecies
            ?.map((e) => e.genus)
            .first;

        return PokemonListTileModel(
          name: pokemonName ?? '',
          sprite: pokemonSprite ?? '',
          id: pokemonId ?? 0,
          type: pokemonTypes ?? [],
          genus: pokemonGenus ?? '',
        );
      },
    ).toList();
  }
}
