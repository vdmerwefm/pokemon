String gqlPokemonAbilitiesFragment = '''
fragment pokemon_abilites on pokemon {
  pokemonabilities {
    ability {
      name
    }
  }
}
''';
