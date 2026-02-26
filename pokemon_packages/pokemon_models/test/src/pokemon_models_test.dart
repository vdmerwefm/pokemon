// Not required for test files
// ignore_for_file: prefer_const_constructors

import 'package:flutter_test/flutter_test.dart';
import 'package:pokemon_models/pokemon_models.dart';

void main() {
  group('PokemonModels', () {
    test('can be instantiated', () {
      expect(PokemonModels(), isNotNull);
    });
  });
}
