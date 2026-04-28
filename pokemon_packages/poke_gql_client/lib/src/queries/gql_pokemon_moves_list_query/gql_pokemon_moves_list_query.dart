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
    pokemonmoves(distinct_on: [pokemon_id]){
      pokemon{
        name
      }
    }
  }
}
''';
