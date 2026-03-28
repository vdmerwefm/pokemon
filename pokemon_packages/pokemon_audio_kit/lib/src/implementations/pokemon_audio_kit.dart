import 'package:flutter_soloud/flutter_soloud.dart';
import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';
import 'package:pokemon_audio_kit/src/interfaces/i_pokemon_audio_kit.dart';
import 'package:pokemon_core/pokemon_core.dart';

@Injectable(as: IPokemonAudioKit)
class PokemonAudioKit implements IPokemonAudioKit {
  late SoundHandle soundHandle;
  @override
  TaskEither<Failure, void> playPokemonThemeMusic() {
    return TaskEither.tryCatch(() async {
      final response = await SoLoud.instance.loadAsset(
        'packages/pokemon_audio_kit/lib/src/assets/sounds/pokemon_title_theme.mp3',
      );

      soundHandle = await SoLoud.instance.play(
        response,
        looping: true,
        loopingStartAt: const Duration(seconds: 1),
        volume: 0.5,
      );
    }, (error, stackTrace) => Failure.audioFailure());
  }

  @override
  TaskEither<Failure, void> togglePokemonThemeMusic({
    required bool toggleSoundHandle,
  }) {
    return TaskEither.tryCatch(() async {
      SoLoud.instance.setPause(soundHandle, toggleSoundHandle);
    }, (error, stackTrace) => Failure.audioFailure());
  }

  @override
  TaskEither<Failure, void> playPokemonCry(String pokemonCry) {
    return TaskEither.tryCatch(() async {
      final response = await SoLoud.instance.loadUrl(pokemonCry);

      await SoLoud.instance.play(
        response,
        volume: 0.5,
      );

      await Future.delayed(const Duration(seconds: 5), () {
        SoLoud.instance.disposeSource(response);
      });
    }, (error, stacktrace) => Failure.audioFailure());
  }
}
