import 'package:poke_api_client/poke_api_client.dart';
import 'package:pokemon_repositories/pokemon_repositories.dart';

class PokemonRepository implements IPokemonRepository {
  PokemonRepository(this._apiClient);
  final PokeApiClient _apiClient; // Your existing Dio client package

  @override
  Future<dynamic> getPokemonDetails(String name) async {
      // TODO: implement fetchPokemonList
    throw UnimplementedError();
  }
  
  @override
  Future<List<dynamic>> fetchPokemonList({int limit = 20, int offset = 0}) {
    // TODO: implement fetchPokemonList
    throw UnimplementedError();
  }
  
  // ...
}
