part of 'pokemon_search_bloc.dart';

@freezed
class PokemonSearchState with _$PokemonSearchState {
  const factory PokemonSearchState({
    @Default(true) bool isLoading,
    List<PokemonListTileModel>? pokemonList,
    List<PokemonMovesListModel>? pokemonMoves,
    Failure? failure,
  }) = _PokemonSearchState;

  factory PokemonSearchState.fromJson(Map<String, dynamic> json) =>
      _$PokemonSearchStateFromJson(json);

  factory PokemonSearchState.empty() => const PokemonSearchState();
}
