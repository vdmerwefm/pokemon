import 'package:flutter_soloud/flutter_soloud.dart';
import 'package:injectable/injectable.dart';

@injectable
class Sounds {
  static const String pokemonmaintheme =
      'packages/pokemon_ui_kit/lib/src/assets/sounds/pokemon_title_theme.mp3';

  Future<AudioSource> get getPokemonMainTheme async =>
      SoLoud.instance.loadAsset(pokemonmaintheme);

}
