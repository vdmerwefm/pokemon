part of '../domain_leaf.dart';

@Injectable()
class GetPokemonMainUseCase {
  GetPokemonMainUseCase(this._sounds);
  final Sounds _sounds;

  Future<AudioSource> getPokemonMainThemeUseCase() async {
    return _sounds.getPokemonMainTheme;
  }
}
