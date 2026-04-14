String pokemonEvolutionChainDetailsQuery = r'''
query PokemonEvolutionChainDetails($name: String = "venusaur") {
  pokemon(where: {name: {_eq: $name}}) {
    id
    name
    pokemon_genus: pokemonspecy {
      pokemonspecies: pokemonspeciesnames(where: {language_id: {_eq: 9}}) {
        genus
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
}
''';
