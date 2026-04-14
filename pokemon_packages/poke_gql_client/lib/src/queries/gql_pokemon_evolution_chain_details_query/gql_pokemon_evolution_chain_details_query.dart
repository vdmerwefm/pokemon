String pokemonEvolutionChainDetailsQuery = r'''
query PokemonEvolutionChainDetails($name: String = "venusaur") {
  pokemon(where: {name: {_eq: $name}}) {
    id
    name
    pokemontypes {
      type {
        name
      }
    }
    pokemonsprites{
      sprites
    }
    pokemonspecy{
      pokemonspecies: pokemonspeciesnames(where: {language: {name: {_eq: "en"}}}) {
          genus
      }
    }
  }
}
''';
