part of 'pokemon_main_bloc.dart';

@freezed
class PokemonMainState with _$PokemonMainState {
  const factory PokemonMainState({
    @Default(false) bool toggleThemeMusic,
    Failure? failure,
    @Default(false) bool isLoading,
  }) = _PokemonMainState;

  factory PokemonMainState.empty() => const PokemonMainState();
}
