abstract interface class IPokemonRepository {
  Future<List<dynamic>> getPokemonList();
  Future<dynamic> getPokemonDetails(String name);
}
