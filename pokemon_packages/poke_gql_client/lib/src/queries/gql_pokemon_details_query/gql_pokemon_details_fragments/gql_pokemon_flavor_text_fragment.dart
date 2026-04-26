String gqlPokemonFlavorTextFragment = '''
fragment pokemon_flavor_text on pokemon {
  pokemon_flavor_text: pokemonspecy {
    pokemonspecies: pokemonspeciesflavortexts(
      where: {language_id: {_eq: 9}}
      limit: 1
    ) {
      flavor_text
    }
  }
}
''';
