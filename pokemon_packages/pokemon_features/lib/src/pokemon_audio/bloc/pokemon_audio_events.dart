part of 'pokemon_audio_bloc.dart';

@freezed
abstract class PokemonAudioEvents with _$PokemonAudioEvents {
  const factory PokemonAudioEvents.onPlayPokemonThemeMusic() =
      OnPlayPokemonThemeMusic;
  const factory PokemonAudioEvents.onTogglePokemonThemeMusic({
    required bool pausePokemonThemeMusic,
  }) = OnTogglePokemonThemeMusic;
  const factory PokemonAudioEvents.onLifecyclePokemonThemeMusic({
    required AppLifecycleState state,
  }) = OnLifecyclePokemonThemeMusic;
  const factory PokemonAudioEvents.onPlayPokemonCry({
    required String pokemonCry,
  }) = OnPlayPokemonCry;
  const factory PokemonAudioEvents.onPlaySelectBite() = OnPlaySelectBite;
}
