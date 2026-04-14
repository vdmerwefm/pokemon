import 'package:poke_gql_client/poke_gql_client.dart';
import 'package:pokemon_models/pokemon_models.dart';

extension PokemonEvolutionChainDetailsMapper
    on GqlPokemonEvolutionChainDetailsDto {
  List<PokemonListTileModel> toPokemonEvolutionChainDetails() {
    final pokemonList = data?.pokemon;

    if (pokemonList == null || pokemonList.isEmpty) {
      return [];
    }

    return pokemonList.map((rawPokemon) {
      final pokemonName = rawPokemon.name;

      final pokemonSprite =
          (rawPokemon
                      ?.pokemonsprites
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

      final pokemonGenus =
          rawPokemon.pokemonspecy?.pokemonspecies?.firstOrNull?.genus;

      return PokemonListTileModel(
        name: pokemonName ?? '',
        sprite: pokemonSprite ?? '',
        id: pokemonId ?? 0,
        type: pokemonTypes ?? [],
        genus: pokemonGenus ?? '',
      );
    }).toList();
  }
}
