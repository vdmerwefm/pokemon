part of 'pokemon_moves_list_bloc.dart';

@freezed
class PokemonMovesListState with _$PokemonMovesListState {
  const factory PokemonMovesListState({
    @Default(false) bool isLoading,
    Failure? failure,
    List<PokemonMovesListModel>? pokemonMovesList,
  }) = _PokemonMovesListState;

  factory PokemonMovesListState.fromJson(Map<String, dynamic> json) =>
      _$PokemonMovesListStateFromJson(json);

  factory PokemonMovesListState.empty() => const PokemonMovesListState();
}
