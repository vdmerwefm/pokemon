part of 'pokemon_moves_list_bloc.dart';

@freezed
class PokemonMovesListState with _$PokemonMovesListState {
  const factory PokemonMovesListState({
    @Default(false) bool isLoading,
    @Default(false) bool isLoadingMoreMoves,
    Failure? failure,
    List<PokemonMovesListModel>? pokemonMovesList,
    List<PokemonMovesListModel>? paginatedPokemonMovesList,
    @Default(25) int limit,
    @Default(false) bool dexLimit, 
  }) = _PokemonMovesListState;

  factory PokemonMovesListState.fromJson(Map<String, dynamic> json) =>
      _$PokemonMovesListStateFromJson(json);

  factory PokemonMovesListState.empty() => const PokemonMovesListState();
}
