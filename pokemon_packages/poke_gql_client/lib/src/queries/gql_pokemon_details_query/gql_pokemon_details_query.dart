String gqlPokemonDetailsQuery = r'''
query PokemonDetails($name: String = "venusaur") {
  pokemon(where: {name: {_eq: $name}}) {
    id
    name
    height
    weight
    is_default
    pokemonabilities {
      ability {
        name
      }
    }
    pokemon_genus: pokemonspecy {
      pokemonspecies: pokemonspeciesnames(where: {language_id: {_eq: 9}}) {
        genus
      }
    }
    pokemon_flavor_text: pokemonspecy {
      pokemonspecies: pokemonspeciesflavortexts(where: {language_id: {_eq: 9}}) {
        flavor_text
      }
    }
    pokemon_evolutions: pokemonspecy {
      pokemonspeciesnames: evolutionchain {
        pokemonspecies(order_by: [ {
           order: asc
        }]) {
          name
        }
      }
    }
    pokemoncries {
      cries
    }
    pokemonmoves {
      move {
        name
        type{
          name
        }
      }
      movelearnmethod {
        name
      }
    }
    pokemonsprites {
      sprites
    }
    pokemontypes {
      type {
        name
      }
    }
  }
  pokemonstat(where: {pokemon: {name: {_eq: $name}}}) {
    stat {
      name
    }
    base_stat
  }
}
''';
