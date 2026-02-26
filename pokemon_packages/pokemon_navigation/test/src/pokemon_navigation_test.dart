// Not required for test files
// ignore_for_file: prefer_const_constructors

import 'package:flutter_test/flutter_test.dart';
import 'package:pokemon_navigation/pokemon_navigation.dart';

void main() {
  group('PokemonNavigation', () {
    test('can be instantiated', () {
      expect(PokemonNavigation(), isNotNull);
    });
  });
}
