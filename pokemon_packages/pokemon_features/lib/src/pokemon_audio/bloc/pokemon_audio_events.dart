part of 'pokemon_audio_bloc.dart';

@freezed
abstract class PokemonAudioEvents with _$PokemonAudioEvents{
  const factory PokemonAudioEvents.onPlayPokemonThemeMusic() =
      OnPlayPokemonThemeMusic;
  const factory PokemonAudioEvents.onTogglePokemonThemeMusic() =
      OnTogglePokemonThemeMusic;
  const factory PokemonAudioEvents.onPlayPokemonCry({
    required String pokemonCry,
  }) = OnPlayPokemonCry;
  const factory PokemonAudioEvents.onPlaySelectBite() = OnPlaySelectBite;
}
