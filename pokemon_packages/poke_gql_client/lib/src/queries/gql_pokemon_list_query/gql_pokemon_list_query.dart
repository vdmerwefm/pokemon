import 'package:poke_gql_client/src/queries/gql_shared_fragments/_barrel_gql_shared.dart';

String gqlPokemonListQuery =
    ''' 
query GqlPokemonListQuery {
  pokemon {
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
