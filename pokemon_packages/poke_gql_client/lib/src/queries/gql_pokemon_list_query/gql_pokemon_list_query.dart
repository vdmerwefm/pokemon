String gqlPokemonListQuery = r''' 
query GetPokemonWithTypes($limit: Int = 10) {
  pokemon(limit: $limit) {
    id
    name
    pokemontypes {
      type {
        name
      }
    }
    pokemonsprites {
      sprites
    }
    pokemonspecy{
      pokemonspecies{
        pokemonspeciesnames(where: {language: {name: {_eq: "en"}}}) {
          genus
        }
      }
    }
  }
}
''';
