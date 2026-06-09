import 'package:poke_gql_client/src/queries/gql_shared_fragments/gql_shared_leaf.dart';

String gqlPokemonMoveDetailsQuery ='''
query gqlPokemonMoveDetailsQuery(\$name: String = "cut") {
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
        id
        name
        height
        weight
        is_default
        pokemonsprites {
          sprites(path: "other.official-artwork.front_default")
        }
        pokemontypes {
          type {
            name
          }
        }
        pokemon_genus: pokemonspecy {
          pokemonspecies: pokemonspeciesnames(where: {language_id: {_eq: 9}}) {
            genus
          }
        }
      }
    }
  }
}

$gqlPokemonSpritesFragment
$gqlPokemonInfoFragment
$gqlPokemonGenusFragment
$gqlPokemonTypesFragment
''';
