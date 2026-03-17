String gqlPokemonListQuery = r''' 
query GqlPokemonListQuery($limit: Int = 1300) {
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
  }
}
''';
