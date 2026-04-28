part of 'pokemon_moves_list_bloc.dart';

@freezed
class PokemonMovesListState with _$PokemonMovesListState {
  const factory PokemonMovesListState({
    @Default(false) bool isLoading,
    String? name,
    String? type,
    String? damageClass,
    int? powerPoints,
    int? accuracy,
    int? pokemonCount,
  }) = _PokemonMovesListState;

  factory PokemonMovesListState.fromJson(Map<String, dynamic> json) => _$PokemonMovesListStateFromJson(json);

  factory PokemonMovesListState.empty() => PokemonMovesListState();
}
