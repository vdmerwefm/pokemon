String gqlPokemonListQuery = r''' 
query GetPokemonWithTypes($limit: Int = 9, $offset: Int = 0) {
  pokemon(limit: $limit, offset: $offset) {
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
