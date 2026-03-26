part of '../domain_leaf.dart';

@Injectable()
class GetPokemonMainUseCase {
  GetPokemonMainUseCase(this._ipokemonAudioKit);
  final IPokemonAudioKit _ipokemonAudioKit;

  Future<Either<Failure, SoundHandle>> getPokemonMainThemeUseCase() async {
    return _ipokemonAudioKit.getPokemonMainTheme().run();
  }
}
