String gqlPokemonMovesFragment = '''
fragment pokemon_moves on pokemon {
  pokemonmoves(
    where: {versiongroup: {versions: {name: {_eq: "lets-go-pikachu"}}}}
  ) {
    level
    move {
      name
      type {
        name
      }
    }
    movelearnmethod {
      name
    }
  }
}
''';
