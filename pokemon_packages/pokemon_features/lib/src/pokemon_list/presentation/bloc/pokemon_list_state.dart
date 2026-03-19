part of 'pokemon_list_bloc.dart';

@freezed
class PokemonListState with _$PokemonListState {
  const factory PokemonListState({
    List<PokemonListModel>? pokemonList,
    Failure? failure,
    @Default(9)int limit,
    @Default(0)int offset,
    @Default(false) bool isLoading,
  }) = _PokemonListState;

  factory PokemonListState.fromJson(Map<String, dynamic> json) =>
      _$PokemonListStateFromJson(json);

  factory PokemonListState.empty() => const PokemonListState();
}
