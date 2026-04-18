part of 'pokemon_audio_bloc.dart';

@freezed
class PokemonAudioState with _$PokemonAudioState{
  const factory PokemonAudioState({
    @Default(false)bool isLoading,
    @Default(false) bool toggleThemeMusic,
    Failure? failure,
  }) = _PokemonAudioState;

    factory PokemonAudioState.fromJson(Map<String, dynamic> json) =>
      _$PokemonAudioStateFromJson(json);

  factory PokemonAudioState.empty() => const PokemonAudioState();
}
