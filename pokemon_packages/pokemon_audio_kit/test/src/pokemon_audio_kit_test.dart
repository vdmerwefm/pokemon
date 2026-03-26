// Not required for test files
// ignore_for_file: prefer_const_constructors

import 'package:flutter_test/flutter_test.dart';
import 'package:pokemon_audio_kit/src/implementations/pokemon_audio_kit.dart';

void main() {
  group('PokemonAudioKit', () {
    test('can be instantiated', () {
      expect(PokemonAudioKit(), isNotNull);
    });
  });
}
