import 'package:flutter_soloud/flutter_soloud.dart';
import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';
import 'package:pokemon_audio_kit/src/interfaces/i_pokemon_audio_kit.dart';
import 'package:pokemon_core/pokemon_core.dart';

@Injectable(as: IPokemonAudioKit)
class PokemonAudioKit implements IPokemonAudioKit {
  @override
  TaskEither<Failure, SoundHandle> getPokemonMainTheme() {
    return TaskEither.tryCatch(() async {
      final response = await SoLoud.instance.loadAsset(
        'packages/pokemon_audio_kit/lib/src/assets/sounds/pokemon_title_theme.mp3',
      );

      final mainThemeSoundHandle = await SoLoud.instance.play(
        response,
        looping: true,
        volume: 0.1,
      );
      return mainThemeSoundHandle;
    }, (error, stackTrace) => Failure.audioFailure());
  }

  @override
  TaskEither<Failure, SoundHandle> getPokemonCry(String pokemonCry) {
    return TaskEither.tryCatch(() async {
      final response = await SoLoud.instance.loadUrl(pokemonCry);

      final pokemonCrySoundHandle = await SoLoud.instance.play(
        response,
        volume: 0.5,
      );

      return pokemonCrySoundHandle;
    }, (error, stacktrace) => Failure.audioFailure());
  }
}
