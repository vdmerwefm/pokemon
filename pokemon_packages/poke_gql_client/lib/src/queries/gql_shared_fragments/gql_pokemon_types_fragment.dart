String gqlPokemonTypesFragment = '''
fragment pokemon_types on pokemon {
  pokemontypes {
    type {
      name
    }
  }
}
''';
