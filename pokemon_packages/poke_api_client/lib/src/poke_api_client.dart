import 'package:poke_api_client/poke_api_client.dart';

/// Api client for retrieving pokemon data from pokeapi.com
class PokeApiClient {
  /// {@macro poke_api_client}
  PokeApiClient(this.pokeDio);

  final PokeDio pokeDio;
}
