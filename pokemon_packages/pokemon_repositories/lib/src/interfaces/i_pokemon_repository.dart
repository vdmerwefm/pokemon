abstract interface class IPokemonRepository {
  Future<List<dynamic>> fetchPokemonList({int limit = 20, int offset = 0});
  Future<dynamic> getPokemonDetails(String name);
}
