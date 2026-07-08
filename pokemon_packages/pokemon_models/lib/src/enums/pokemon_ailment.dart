enum PokemonAilment {
  paralysis,
  poison,
  burn,
  sleep,
  freeze,
  fianted;

  String get ailmentImagePath =>
      'lib/src/assets/images/ailment/${PokemonAilment.values.elementAt(index).name.toLowerCase()}.png';
}
