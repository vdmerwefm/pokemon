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

  String get typeImagePath =>
      'lib/src/assets/images/types/${PokemonType.values.elementAt(index).name.toLowerCase()}_type_symbol.png';

  String get moveTypeImagePath =>
      'lib/src/assets/images/moves/${PokemonType.values.elementAt(index).name.toLowerCase()}_move.png';
}
