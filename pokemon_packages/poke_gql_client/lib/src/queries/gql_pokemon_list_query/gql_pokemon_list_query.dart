import 'package:poke_gql_client/src/queries/gql_shared_fragments/_barrel_gql_shared.dart';

String gqlPokemonListQuery =
    ''' 
query GqlPokemonListQuery(\$limit: Int = 25, \$offset: Int = 0) {
  pokemon(limit: \$limit, offset: \$offset) {
    ...pokemon_info
    ...pokemon_genus
    ...pokemon_sprites
    ...pokemon_types
  }
}

$gqlPokemonSpritesFragment
$gqlPokemonInfoFragment
$gqlPokemonGenusFragment
$gqlPokemonTypesFragment
''';
