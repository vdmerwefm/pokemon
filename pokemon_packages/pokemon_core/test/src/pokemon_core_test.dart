// Not required for test files
// ignore_for_file: prefer_const_constructors

import 'package:flutter_test/flutter_test.dart';
import 'package:pokemon_core/pokemon_core.dart';

void main() {
  group('PokemonCore', () {
    test('can be instantiated', () {
      expect(PokemonCore(), isNotNull);
    });
  });
}
