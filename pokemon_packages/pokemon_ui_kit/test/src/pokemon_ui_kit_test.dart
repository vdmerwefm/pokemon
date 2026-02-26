// Not required for test files
// ignore_for_file: prefer_const_constructors

import 'package:flutter_test/flutter_test.dart';
import 'package:pokemon_ui_kit/pokemon_ui_kit.dart';

void main() {
  group('PokemonUiKit', () {
    test('can be instantiated', () {
      expect(PokemonUiKit(), isNotNull);
    });
  });
}
