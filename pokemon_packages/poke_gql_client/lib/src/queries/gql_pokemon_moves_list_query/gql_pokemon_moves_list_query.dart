String gqlPokemonMovesListQuery = '''
query gqlPokemonMovesQuery  {
  move{
    id
    name
    type{
      name
    }
    movedamageclass{
      name
    }
  }
}
''';
