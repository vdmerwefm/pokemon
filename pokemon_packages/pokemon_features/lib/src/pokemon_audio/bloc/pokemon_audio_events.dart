part of 'pokemon_audio_bloc.dart';

@freezed
abstract class PokemonAudioEvents with _$PokemonAudioEvents {
  const factory PokemonAudioEvents.onPlayPokemonThemeMusic() =
      OnPlayPokemonThemeMusic;
  // nullable to permit use during lifecycle changes
  const factory PokemonAudioEvents.onTogglePokemonThemeMusic({
    bool? pausePokemonThemeMusic,
  }) = OnTogglePokemonThemeMusic;
  const factory PokemonAudioEvents.onPlayPokemonCry({
    required String pokemonCry,
  }) = OnPlayPokemonCry;
  const factory PokemonAudioEvents.onPlaySelectBite() = OnPlaySelectBite;
}
