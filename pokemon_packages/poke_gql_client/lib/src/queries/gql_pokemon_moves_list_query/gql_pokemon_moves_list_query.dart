String gqlPokemonMovesListQuery = '''
query gqlPokemonMovesQuery {
  move{
    name
    type{
      name
    }
    power
    accuracy
    movedamageclass{
      name
    }
  }
}
''';
