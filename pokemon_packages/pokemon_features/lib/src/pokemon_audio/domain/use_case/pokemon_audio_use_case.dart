part of '../domain_leaf.dart';

@Injectable()
class GetPokemonAudioUseCase {
  GetPokemonAudioUseCase(this._audioKit);
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

  Future<Either<Failure, void>> playPokemonCryUseCase({required String cry}) {
    return _audioKit.playPokemonCry(cry: cry).run();
  }

  Future<Either<Failure, void>> playSelectUseCase() {
    return _audioKit.playSelectBite().run();
  }
}
