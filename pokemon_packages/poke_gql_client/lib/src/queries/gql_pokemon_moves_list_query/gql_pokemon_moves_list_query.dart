String gqlPokemonMovesListQuery = r'''
query gqlPokemonMovesQuery($limit: Int = 25, $offset: Int = 0)  {
  move(limit: $limit, offset: $offset){
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
