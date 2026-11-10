part of 'pokemon_filter_bloc.dart';

@freezed
class PokemonFilterState with _$PokemonFilterState {
  const factory PokemonFilterState({
    @Default('All Types') String filterString,
    @Default(0) int filterIndex,
  }) = _PokemonFilterState;

  factory PokemonFilterState.fromJson(Map<String, dynamic> json) =>
      _$PokemonFilterStateFromJson(json);

  factory PokemonFilterState.empty() => const PokemonFilterState();
}
