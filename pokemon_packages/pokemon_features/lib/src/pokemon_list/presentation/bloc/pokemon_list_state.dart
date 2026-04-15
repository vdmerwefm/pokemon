part of 'pokemon_list_bloc.dart';

@freezed
class PokemonListState with _$PokemonListState {
  const factory PokemonListState({
    List<PokemonListTileModel>? pokemonList,
    Failure? failure,
    @Default(25) int limit,
    @Default(0) int offset,
    @Default(false) bool isLoading,
    @Default(false) bool isLoadingMorePokemon,
  }) = _PokemonListState;

  factory PokemonListState.fromJson(Map<String, dynamic> json) =>
      _$PokemonListStateFromJson(json);

  factory PokemonListState.empty() => const PokemonListState();
}
