String gqlPokemonGenusFragment = '''
fragment pokemon_genus on pokemon {
  pokemon_genus: pokemonspecy {
    pokemonspecies: pokemonspeciesnames(where: {language_id: {_eq: 9}}) {
      genus
    }
  }
}
''';
