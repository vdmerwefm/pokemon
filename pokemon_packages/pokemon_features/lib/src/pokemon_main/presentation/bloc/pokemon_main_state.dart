part of 'pokemon_main_bloc.dart';

@freezed
class PokemonMainState with _$PokemonMainState {
  const factory PokemonMainState({
    AudioSource? pokemonMainThemeMp3,
    bool? failure,
    bool? isLoading,
  }) = _PokemonMainState;

  factory PokemonMainState.empty() => const PokemonMainState();
}
