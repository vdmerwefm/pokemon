String gqlPokemonStatsFragment = '''
fragment pokemon_stats on pokemonstat {
  stat {
    name
  }
  base_stat
}
''';
