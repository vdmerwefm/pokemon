import 'package:poke_gql_client/src/queries/gql_pokemon_details_query/_barrel_gql_pokemon_details.dart';

String gqlPokemonDetailsQuery =
    '''
query PokemonDetails(\$name: String) {
  pokemon(where: {name: {_eq: \$name}}) {
    ...pokemon_info
    ...pokemon_abilites
    ...pokemon_genus
    ...pokemon_flavor_text
    ...pokemon_evolutions
    ...pokemon_cry
    ...pokemon_moves
    ...pokemon_sprites
    ...pokemon_types
  }
  pokemonstat(where: {pokemon: {name: {_eq: \$name}}}) {
    ...pokemon_stats
  }
}

$gqlPokemonSpritesFragment
$gqlPokemonInfoFragment
$gqlPokemonTypesFragment
$gqlPokemonFlavorTextFragment
$gqlPokemonGenusFragment
$gqlPokemonCryFragment
$gqlPokemonAbilitiesFragment
$gqlPokemonEvolutionsFragment
$gqlPokemonMovesFragment
$gqlPokemonStatsFragment
''';
