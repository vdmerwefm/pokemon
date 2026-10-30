part of 'pokemon_search_bloc.dart';

@freezed
class PokemonSearchState with _$PokemonSearchState {
  const factory PokemonSearchState({
    List<PokemonListTileModel>? pokemonList,
    @Default(true) bool isPokemonListLoading,
    List<PokemonMovesListModel>? pokemonMoves,
    @Default(true) bool isPokemonMovesLoading,
    Failure? failure,
  }) = _PokemonSearchState;

  factory PokemonSearchState.fromJson(Map<String, dynamic> json) =>
      _$PokemonSearchStateFromJson(json);

  factory PokemonSearchState.empty() => const PokemonSearchState();
}
