String gqlPokemonEvolutionsFragment = '''
fragment pokemon_evolutions on pokemon {
  pokemon_evolutions: pokemonspecy {
    pokemonspeciesnames: evolutionchain {
      pokemonspecies(order_by: [{order: asc}]) {
        pokemons {
          pokemonforms {
            id
            name
            form_name
            formdetails: pokemon {
              pokemon_genus: pokemonspecy {
                pokemonspecies: pokemonspeciesnames(where: {language_id: {_eq: 9}}) {
                  genus
                }
              }
              pokemontypes {
                type {
                  name
                }
              }
              pokemonsprites {
                sprites(path: "other.official-artwork.front_default")
              }
            }
          }
        }
      }
    }
  }
}
''';
