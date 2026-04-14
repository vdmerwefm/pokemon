class StringUtils {
  static String convertPokemonHeight(int? height) {
    return '${(height ?? 0) / 10} meters';
  }

  static String convertPokemonWeight(int? weight) {
    return '${(weight ?? 0) / 10} kg';
  }

  static String idValidator(int? id) {
    final pokemonId = (id ?? 0).toString();
    if (pokemonId.length == 1) {
      return '#00$pokemonId';
    } else if (pokemonId.length == 2) {
      return '#0$pokemonId';
    } else {
      return '#$pokemonId';
    }
  }

  static String restructurePokemonFlavorText(String flavorText) {
    return flavorText
        .replaceAll('\n', ' ')
        .replaceAll('\f', ' ')
        .replaceAll('’', "'")
        .replaceAll('é', 'E');
  }
}
