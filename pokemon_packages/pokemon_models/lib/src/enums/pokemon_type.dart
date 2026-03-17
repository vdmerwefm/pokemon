enum PokemonType {
  bug,
  dark,
  dragon,
  electric,
  fairy,
  fighting,
  fire,
  flying,
  ghost,
  grass,
  ground,
  ice,
  normal,
  poison,
  psychic,
  rock,
  steel,
  water;

  String get imagePath =>
      'lib/src/assets/images/${PokemonType.values.elementAt(index).name}_type_symbol.png';
}
