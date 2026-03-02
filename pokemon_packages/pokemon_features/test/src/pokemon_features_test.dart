// Not required for test files
// ignore_for_file: prefer_const_constructors

import 'package:flutter_test/flutter_test.dart';
import 'package:pokemon_features/pokemon_features.dart';

void main() {
  group('PokemonFeatures', () {
    test('can be instantiated', () {
      expect(PokemonFeatures(), isNotNull);
    });
  });
}
