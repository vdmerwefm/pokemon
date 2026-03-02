// Not required for test files
// ignore_for_file: prefer_const_constructors

import 'package:flutter_test/flutter_test.dart';
import 'package:poke_api_client/poke_api_client.dart';

void main() {
  group('PokeApiClient', () {
    test('can be instantiated', () {
      expect(PokeApiClient(PokeDio()), isNotNull);
    });
  });
}
