part of 'pokemon_list_bloc.dart';

@freezed
class PokemonListState with _$PokemonListState {
  const factory PokemonListState({
    List<PokemonListModel>? pokemonList,
    String? randomPokemon,
    Failure? failure,
    @Default(false) bool isLoading,
  }) = _PokemonListState;

  factory PokemonListState.fromJson(Map<String, dynamic> json) =>
      _$PokemonListStateFromJson(json);

  factory PokemonListState.empty() => const PokemonListState();
}
