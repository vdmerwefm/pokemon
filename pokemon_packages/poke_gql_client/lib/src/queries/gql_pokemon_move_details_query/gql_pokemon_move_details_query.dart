import 'package:poke_gql_client/src/queries/gql_shared_fragments/gql_shared_leaf.dart';

String gqlPokemonMoveDetails =
    '''
query gqlPokemonMoveDetailsQuery(\$name: String) {
  move(where: {name: {_eq: \$name}}) {
    id
    name
    type {
      name
    }
    moveflavortexts(
      where: {versiongroup: {name: {_eq: "lets-go-pikachu-lets-go-eevee"}}, _and: [{language_id: {_eq: 9}}]}
    ) {
      flavor_text
    }
    power
    accuracy
    pp
    movedamageclass {
      name
      movedamageclassdescriptions(where: {language_id: {_eq: 9}}) {
        description
      }
    }
    movemeta(where: {move: {name: {_eq: \$name}}}) {
      movemetaailment {
        name
      }
    }
    moveeffect {
      moveeffecteffecttexts(where: {language_id: {_eq: 9}}) {
        short_effect
      }
    }
    machines {
      item {
        name
      }
      versiongroup {
        name
      }
    }
    pokemonmoves(distinct_on: [pokemon_id]) {
      pokemon {
        ...pokemon_info
        ...pokemon_genus
        ...pokemon_sprites
        ...pokemon_types
      }
    }
  }
}

$gqlPokemonSpritesFragment
$gqlPokemonInfoFragment
$gqlPokemonGenusFragment
$gqlPokemonTypesFragment
''';
