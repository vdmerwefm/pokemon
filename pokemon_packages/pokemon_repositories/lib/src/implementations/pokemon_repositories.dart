import 'package:poke_api_client/poke_api_client.dart';
import 'package:pokemon_repositories/pokemon_repositories.dart';

class PokemonRepository implements IPokemonRepository {
  PokemonRepository(this._pokeApiClient);
  final PokeApiClient _pokeApiClient;

  @override
  Future<List<dynamic>> getPokemonList() {
    final reponse = _pokeApiClient.fetchRawPokemonList();
    throw UnimplementedError();
  }

  @override
  Future<dynamic> getPokemonDetails(String name) async {
    final response = _pokeApiClient.getPokemonDetails(name);
    throw UnimplementedError();
  }

  // ...
}
