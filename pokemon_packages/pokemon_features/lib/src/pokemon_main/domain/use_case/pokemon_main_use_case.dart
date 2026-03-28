part of '../domain_leaf.dart';

@Injectable()
class GetPokemonMainUseCase {
  GetPokemonMainUseCase(this._audioKit);
  final IPokemonAudioKit _audioKit;

  Future<Either<Failure, void>> playPokemonThemeMusicUseCase() async {
    return _audioKit.playPokemonThemeMusic().run();
  }

  Future<Either<Failure, void>> togglePokemonThemeMusicUseCase({
    required bool toggleSoundHandle,
  }) async {
    return _audioKit
        .togglePokemonThemeMusic(
          toggleSoundHandle: toggleSoundHandle,
        )
        .run();
  }
}
