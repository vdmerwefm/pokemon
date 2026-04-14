import 'package:poke_gql_client/poke_gql_client.dart';
import 'package:pokemon_models/pokemon_models.dart';

extension PokemonEvolutionChainDetailsMapper
    on GqlPokemonEvolutionChainDetailsDto {
  PokemonListTileModel toPokemonEvolutionChainDetails() {
    final rawPokemon = data!.pokemon;

    final pokemonName = rawPokemon?.name;

    final pokemonSprite =
        (rawPokemon
                    ?.pokemonsprites
                    ?.firstOrNull
                    ?.sprites
                    ?.other?['official-artwork']
                as Map<String, dynamic>?)?['front_default']
            as String?;

    final pokemonId = rawPokemon?.id;

    final pokemonTypes = rawPokemon?.pokemontypes
        ?.map((type) => type.type?.name ?? '')
        .toSet()
        .toList();

    final pokemonGenus =
        rawPokemon?.pokemonspecy?.pokemonSpecies?.firstOrNull?.genus;

    return PokemonListTileModel(
      name: pokemonName ?? '',
      sprite: pokemonSprite ?? '',
      id: pokemonId ?? 0,
      type: pokemonTypes ?? [],
      genus: pokemonGenus ?? '',
    );
  }
}
