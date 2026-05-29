String gqlPokemonSpritesFragment = '''
fragment pokemon_sprites on pokemon {
  pokemonsprites {
    sprites(path: "other.official-artwork.front_default")
  }
}
''';
