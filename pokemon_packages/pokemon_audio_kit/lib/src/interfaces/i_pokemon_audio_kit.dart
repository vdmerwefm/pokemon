import 'package:fpdart/fpdart.dart';
import 'package:pokemon_core/pokemon_core.dart';

// The audio service will also handle pokemon cries
// ignore: one_member_abstracts
abstract interface class IPokemonAudioKit {
  TaskEither<Failure, void> playPokemonThemeMusic();
  TaskEither<Failure, void> togglePokemonThemeMusic({
    required bool toggleSoundHandle,
  });
  TaskEither<Failure, void> playPokemonCry({required String cry});
  TaskEither<Failure, void> playSelectBite();
}
